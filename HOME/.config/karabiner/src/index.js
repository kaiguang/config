import { parse, stringify } from "comment-json";
import { readFileSync, writeFileSync } from "node:fs";

const config = readFileSync("./kai.json", "utf-8");
const parsed = parse(config);
writeFileSync("~/.config/karabiner/assets/complex_modifications/kai.json", stringify(parsed, null, 2));
console.log(`${new Date().toLocaleString()} - updated karabiner config`);
