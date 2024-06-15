import {
  quicktype,
  jsonInputForTargetLanguage,
  InputData,
} from "quicktype-core";
import fs from "fs/promises";
import path from "path";

const supportedLanguages = [
  "cjson",
  "c++",
  "cr",
  "cs",
  "dart",
  "elixir",
  "elm",
  "flow",
  "go",
  "haskell",
  "java",
  "js",
  "javascript-prop-types",
  "kotlin",
  "objc",
  "php",
  "pike",
  "py",
  "rs",
  "scala3",
  "Smithy",
  "swift",
  "typescript",
  "typescript-zod",
  "typescript-effect-schema",
  "javascript",
  "cpp",
  "csharp",
  "rust",
  "python",
  "ruby",
];

async function generateTypes(language, jsonString) {
  // Check if the language is supported
  if (!supportedLanguages.includes(language)) {
    throw new Error(
      `Unsupported language: ${language}. Supported languages are: ${supportedLanguages.join(", ")}`,
    );
  }

  // Set up quicktype input data
  const jsonInput = jsonInputForTargetLanguage(language);

  // Add the JSON sample to the input data
  await jsonInput.addSource({
    name: "GeneratedType",
    samples: [jsonString],
  });

  const inputData = new InputData();
  inputData.addInput(jsonInput);

  // Generate the types
  const result = await quicktype({
    inputData,
    lang: language,
    rendererOptions: {
      "just-types": true,
    },
  });

  return result.lines.join("\n");
}

// Usage example
(async () => {
  const language = process.argv[2];
  const jsonFilePath = process.argv[3];

  if (!language || !jsonFilePath) {
    console.error("Usage: node generateTypes.js <language> <jsonFilePath>");
    process.exit(1);
  }

  try {
    const jsonFilePathResolved = path.resolve(jsonFilePath);
    const jsonString = await fs.readFile(jsonFilePathResolved, "utf-8");

    const types = await generateTypes(language, jsonString);
    console.log(types);
  } catch (error) {
    console.error("Error generating types:", error);
  }
})();
