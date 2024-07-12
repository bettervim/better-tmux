type windowType = [
  | #active
  | #normal
]

type windowParams = {
  @as("type") type_: windowType,
  number: string,
  name: string,
}

type window = windowParams => TmuxJsx.element

type status = {
  fg?: string,
  bg?: string,
  left?: TmuxJsx.element,
  right?: TmuxJsx.element,
  position?: string,
}

type options = {
  terminalOverrides?: string,
  escapeTime?: int,
  paneBaseIndex?: int,
  statusKeys?: string,
  setTitles?: string,
  setTitlesString?: string,
  modeKeys?: string,
  prefix?: string,
  baseIndex?: int,
  historyLimit?: int,
  defaultTerminal?: string,
  mouse?: string,
  renumberWindows?: string,
  aggressiveResize?: string,
}

type bind = {
  key: string,
  command: string,
  options?: array<string>
}

type config = {
  bindings?: array<bind>,
  theme?: string,
  status?: status,
  window?: window,
  options?: options,
}


type mod = {default: config}

@val external import_: string => promise<mod> = "import"
