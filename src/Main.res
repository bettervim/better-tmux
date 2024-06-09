module Parser = {
  let getPadding = (props: TmuxJsx.Elements.props) => {
    let calculate = length => Array.make(~length, " ")->Array.join("")
    switch props.padding {
    | None => {
        let paddingLeft = props.paddingLeft->Option.mapOr("", calculate)
        let paddingRight = props.paddingRight->Option.mapOr("", calculate)

        (paddingLeft, paddingRight)
      }
    | Some(value) => (calculate(value), calculate(value))
    }
  }

  let rec make = (node: Reconcilier.Tree.t, body: string) => {
    let element = (~props, ~children) => {
      let styles = props->Styles.inline
      let children = children->Array.reduce("", (body, child) => `${body}${child->make("")}`)
      let (paddingLeft, paddingRight) = getPadding(props)

      [styles, paddingLeft, children, paddingRight]->Array.join("")
    }

    switch node {
    | Element(_, props, children) => element(~props, ~children)
    | TextElement(value) => `${body}${value->Obj.magic}`
    }
  }
}
module Roots = {
  let statusLeft: Reconcilier.root = {
    mount: tree => {
      let content = Parser.make(tree, "")
      Tmux.exec(SetGlobal(StatusLeft(content)))
    },
  }
}

type config = {statusLeft: TmuxJsx.element}

let defineConfig = config => {
  Reconcilier.render(config.statusLeft, Roots.statusLeft)
}
