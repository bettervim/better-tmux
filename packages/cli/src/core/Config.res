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
}

type config = {
  theme?: string,
  status?: status,
  window?: window,
}

type mod = {default: config}

@val external import_: string => promise<mod> = "import"
