import VersoSlides
import Categories.Basic
import Monads.Basic
import SSProve.Basic
import Double.Basic

open VersoSlides
open System

def postProcessSlides (outputDir : FilePath) (logoFile : String) (title : String) (subtitle : String) (org : String) : IO Unit := do
  -- Copy static assets into output directory
  let cssContents ← IO.FS.readFile "static/custom.css"
  IO.FS.writeFile (outputDir / "custom.css") cssContents
  let logoBytes ← IO.FS.readBinFile s!"static/{logoFile}"
  IO.FS.writeBinFile (outputDir / logoFile) logoBytes

  -- Post-process HTML
  let htmlPath := outputDir / "index.html"
  let html ← IO.FS.readFile htmlPath

  -- Inject custom stylesheet at end of <head>
  let html := html.replace "</head>" "<link rel=\"stylesheet\" href=\"custom.css\">\n    </head>"

  -- Inject disableLayout into Reveal.initialize
  let html := html.replace "Reveal.initialize({" "Reveal.initialize({\n        disableLayout: true,"

  -- Inject slide header (logo + line) into content slides (not title slides)
  let slideHeader := s!"<div class=\"slide-header\"><img src=\"{logoFile}\" alt=\"BAIF\"></div>"
  let html := html.replace "<section>\n" s!"<section>\n          {slideHeader}\n"
  let html := html.replace "<section data-transition=\"fade\">\n" s!"<section data-transition=\"fade\">\n          {slideHeader}\n"

  -- Transform title slide
  let titleSlideOld := s!"<section data-state=\"title-slide\">\n          <h2>\n            {title}</h2>\n          <p>\n            {subtitle}</p>\n          <p>\n            {org}</p>\n          </section>"
  let titleSlideNew := s!"<section class=\"title-slide\">\n          <div class=\"top-area\"><img class=\"logo\" src=\"{logoFile}\" alt=\"BAIF Logo\"></div>\n          <div class=\"thick-band\"><h1>{title}</h1>\n          <div class=\"meta\"><strong>{subtitle}</strong></div>\n          <div class=\"date\">{org}</div>\n          </div></section>"
  let html := html.replace titleSlideOld titleSlideNew

  -- Transform Thank You slide
  let thankSlideOld := s!"<section data-state=\"title-slide\">\n          <h2>\n            Thank You</h2>\n          <p>\n            <strong>{org}</strong></p>\n          <p>\n            beneficialaifoundation.org\n</p>\n          </section>"
  let thankSlideNew := s!"<section class=\"title-slide\">\n          <div class=\"top-area\"><img class=\"logo\" src=\"{logoFile}\" alt=\"BAIF Logo\"></div>\n          <div class=\"thick-band\"><h1>Thank You</h1>\n          <div class=\"meta\"><strong>{org}</strong><br><a href=\"https://beneficialaifoundation.org\" style=\"color:#bbf7d0;\">beneficialaifoundation.org</a></div>\n          <div class=\"date\"></div>\n          </div></section>"
  let html := html.replace thankSlideOld thankSlideNew

  IO.FS.writeFile htmlPath html

  -- Inline hover data to avoid fetch CORS issues when opening as local files
  let docsJsonPath := outputDir / "-verso-docs.json"
  if ← docsJsonPath.pathExists then
    let docsJson ← IO.FS.readFile docsJsonPath
    -- Patch highlighting.js
    let hlJsPath := outputDir / "lib" / "highlighting.js"
    if ← hlJsPath.pathExists then
      let hlJs ← IO.FS.readFile hlJsPath
      let hlJs := hlJs.replace
        "fetch(docsJson).then((resp) => resp.json()).then((versoDocData) => {"
        s!"Promise.resolve({docsJson}).then((versoDocData) => \{"
      let hlJs := hlJs.replace
        "window.onload = () => {"
        "window.addEventListener('load', () => {"
      IO.FS.writeFile hlJsPath hlJs
    -- Patch panel.js
    let panelJsPath := outputDir / "lib" / "panel.js"
    if ← panelJsPath.pathExists then
      let panelJs ← IO.FS.readFile panelJsPath
      let panelJs := panelJs.replace
        "fetch(\"-verso-docs.json\")\n            .then(function (r) {\n                return r.ok ? r.json() : {};\n            })\n            .then(function (j) {\n                docsJson = j;\n            })\n            .catch(function () {\n                docsJson = {};\n            });"
        s!"docsJson = {docsJson};"
      IO.FS.writeFile panelJsPath panelJs

def main : IO UInt32 := do
  let config : Config := { theme := "white", center := false, margin := 0, transition := "fade", slideNumber := true }

  -- Build category theory slides
  let categoriesDir := "_site/categories"
  let _ ← slidesMain (config := { config with outputDir := categoriesDir }) (doc := %doc Categories.Basic)
  postProcessSlides categoriesDir "baif.png" "Category Theory" "From Sets to Categories" "Beneficial AI Foundation"

  -- Build monads slides
  let monadsDir := "_site/monads"
  let _ ← slidesMain (config := { config with outputDir := monadsDir }) (doc := %doc Monads.Basic)
  postProcessSlides monadsDir "baif.png" "Monads" "In Mathematics and Programming" "Beneficial AI Foundation"

  -- Build SSProve slides
  let ssproveDir := "_site/ssprove"
  let _ ← slidesMain (config := { config with outputDir := ssproveDir }) (doc := %doc SSProve.Basic)
  postProcessSlides ssproveDir "baif.png" "SSProve" "Modular Cryptographic Proofs in Coq" "Beneficial AI Foundation"

  -- Build Double Categories slides
  let doubleDir := "_site/double"
  let _ ← slidesMain (config := { config with outputDir := doubleDir }) (doc := %doc Double.Basic)
  postProcessSlides doubleDir "baif.png" "Double Categories" "Categories Internal to Cat" "Beneficial AI Foundation"

  return 0
