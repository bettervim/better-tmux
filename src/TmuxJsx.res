type element = React.element

type component<'props> = React.component<'props>
type componentLike<'props, 'return> = React.componentLike<'props, 'return>

type fragmentProps = {children?: element}

@module("react/jsx-runtime") external jsxFragment: component<fragmentProps> = "Fragment"

@module("react/jsx-runtime")
external jsx: (component<'props>, 'props) => element = "jsx"

@module("react/jsx-runtime")
external jsxs: (component<'props>, 'props) => element = "jsxs"

@val external null: Jsx.element = "null"

external float: float => Jsx.element = "%identity"
external int: int => Jsx.element = "%identity"
external string: string => Jsx.element = "%identity"
external array: array<element> => element = "%identity"

module Elements = {
  external someElement: Jsx.element => option<Jsx.element> = "%identity"

  type props = {children?: JsxU.element, qlqcoisa?: string}
  
  @module("react/jsx-runtime")
  external jsx: (string, props) => element = "jsx"

  @module("react/jsx-runtime")
  external jsxs: (string, props) => element = "jsxs"
}
