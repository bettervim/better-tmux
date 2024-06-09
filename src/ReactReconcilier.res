module type Reconcilier = {
  type root
  type componentElement
  type props
}

module Make = (R: Reconcilier) => {
  type t
  type componentElement = R.componentElement
  type root = R.root
  type payload
  type context
  type defaultEventPriority
  type props = R.props
  type hostContext = {isInsideText: bool}

  type createParams<'props> = {
    getRootHostContext: unit => hostContext,
    appendChildToContainer: (root, componentElement) => unit,
    appendInitialChild: (componentElement, componentElement) => unit,
    createInstance: (string, props, root) => componentElement,
    createTextInstance: (Jsx.element) => componentElement,
    prepareUpdate: (componentElement, string, 'props, 'props) => payload,
    commitUpdate: (componentElement, payload) => unit,
    commitTextUpdate: (componentElement, string, string) => unit,
    appendChild: (componentElement, componentElement) => unit,
    getChildHostContext: unit => option<context>,
    shouldSetTextContent: unit => option<bool>,
    prepareForCommit: unit => option<unit>,
    preparePortalMount: unit => unit,
    clearContainer: unit => unit,
    resetAfterCommit: unit => unit,
    resetTextContent: unit => unit,
    hideTextInstance: unit => unit,
    unhideTextInstance: unit => unit,
    getPublicInstance: unit => option<unit>,
    hideInstance: array<unit> => unit,
    unhideInstance: unit => unit,
    insertBefore: (componentElement, componentElement, componentElement) => unit,
    finalizeInitialChildren: unit => bool,
    getCurrentEventPriority: unit => defaultEventPriority,
    beforeActiveInstanceBlur: unit => unit,
    afterActiveInstanceBlur: unit => unit,
    detachDeletedInstance: unit => unit,
    getInstanceFromNode: unit => option<unit>,
    prepareScopeUpdate: unit => unit,
    getInstanceFromScope: unit => option<unit>,
    insertInContainerBefore: unit => unit,
    removeChildFromContainer: unit => unit,
    removeChild: array<unit> => unit,
    isPrimaryRenderer: bool,
    supportsMutation: bool,
    supportsPersistence: bool,
    supportsHydration: bool,
    scheduleTimeout: (unit => unit, int) => int,
    cancelTimeout: int => unit,
    noTimeout: int,
  }

  @module("react-reconciler")
  external create: createParams<{..}> => t = "default"

  type container

  @send
  external createContainer: (
    t,
    root,
    int,
    Js.Nullable.t<string>,
    bool,
    Js.Nullable.t<string>,
    string,
    unit => Js.Nullable.t<string>,
    Js.Nullable.t<string>,
  ) => container = "createContainer"

  type app = Jsx.element

  @send
  external updateContainer: (
    t,
    app,
    container,
    Js.Nullable.t<string>,
    unit => Js.Nullable.t<string>,
  ) => unit = "updateContainer"
}
