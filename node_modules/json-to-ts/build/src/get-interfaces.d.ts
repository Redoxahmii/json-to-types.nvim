import { InterfaceDescription, NameEntry, TypeStructure } from "./model";
export declare function getInterfaceStringFromDescription({ name, typeMap }: InterfaceDescription): string;
export declare function getInterfaceDescriptions(typeStructure: TypeStructure, names: NameEntry[]): InterfaceDescription[];
