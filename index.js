import fs from "fs";

import JsonToTS from "json-to-ts";

function jsonIsValid(json) {
  try {
    JSON.parse(json);
    return true;
  } catch (e) {
    return false;
  }
}

function convertTypes() {
  const temp_path = "./test.txt";
  const file_read = fs.readFileSync(temp_path, "utf8");
  const error = "Provide valid JSON";
  if (!jsonIsValid(file_read)) {
    throw new Error(error);
  }
  const json = JSON.parse(file_read);
  const file = JsonToTS(json).forEach((typeInterface) => {
    console.log(typeInterface);
  });
  return file;
}

try {
  convertTypes();
} catch (error) {
  console.log(error.message); // Log the error message
}
