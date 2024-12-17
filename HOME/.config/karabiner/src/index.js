import { parse, stringify } from "comment-json";
import { readFileSync, writeFileSync } from "node:fs";
import { join } from "node:path";

const config = readFileSync(join(import.meta.dirname, "./kai.json"), "utf-8");
const parsed = parse(config);
writeFileSync("/Users/kai/.config/karabiner/assets/complex_modifications/kai.json", stringify(parsed, null, 2));
console.log(`${new Date().toLocaleString()} - updated karabiner config`);
