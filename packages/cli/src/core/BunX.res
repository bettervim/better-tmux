
type parseArgs<'values> = {
  values: 'values
}

type flag = {
  @as("type") type_: string,
} 

type parseArgsParams<'values> = {
  args: array<string>,
  options: 'values,
  strict: bool,
  allowPositionals: bool,
}

@module("util")
external parseArgs: parseArgsParams<'flags> => parseArgs<'values> = "parseArgs"  
