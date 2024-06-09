module Roots = {
  let rec toString = (node: Reconcilier.Tree.t, content) => {
    switch node {
    | Element(_, props, children) => {
        let styles = props.style->Option.mapOr("", Styles.inline)
        let children = children->Array.reduce("", (acc, child) => `${acc}${child->toString("")}`)
        `${styles}${children}`
      }
    | TextElement(value) => `${content}${value->Obj.magic}`
    }
  }

  let statusLeft: Reconcilier.root = {
    mount: tree => {
      let content = toString(tree, "")
      Tmux.exec(SetGlobal(StatusLeft(content)))
    },
  }
}

type config = {statusLeft: TmuxJsx.element}

let defineConfig = config => {
  Reconcilier.render(config.statusLeft, Roots.statusLeft)
}
