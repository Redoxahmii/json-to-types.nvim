import fs from "fs";
import JsonToTS from "json-to-ts";
function convertTypes() {
  const temp_path = "./test.txt";
  const file_read = fs.readFileSync(temp_path, "utf8");
  const json = JSON.parse(file_read);
  const file = JsonToTS(json).forEach((typeInterface) => {
    console.log(typeInterface);
  });
  return file;
}
convertTypes();
