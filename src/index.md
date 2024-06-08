```typescript
import createReconciler from 'react-reconciler';
import { DefaultEventPriority } from 'react-reconciler/constants.js';
import { Root, ComponentElement, TextElement, updateText, subscribeToEvents, updateNode } from './root';
import equal from 'fast-deep-equal'

type ElementNames = "div"

type Props = Record<string, unknown>

type HostContext = {
  isInsideText: boolean;
};

type UpdatePayload = {
  hasChanged: boolean,
  props: Props,
};

const reconcilier = createReconciler<
  ElementNames,
  Props,
  Root,
  ComponentElement,
  TextElement,
  unknown,
  unknown,
  unknown,
  HostContext,
  UpdatePayload,
  unknown,
  unknown,
  unknown
>({
  getRootHostContext: () => ({
    isInsideText: false
  }),
  appendChildToContainer: (parent, child) => {
    parent.mount(child)
  },
  appendInitialChild: (parent, child) => {
    parent.children.push(child as ComponentElement)
  },
  createInstance(type, props, root) {
    console.log("CreateInstance", { type, props, root })
    return root.createComponent(type, props)
  },
  createTextInstance(text, root) {
    console.log("CreateTextInstance", { text, root })
    return root.createText(text)
  },
  prepareUpdate(_, __, oldProps, newProps) {
    return { hasChanged: !equal(oldProps, newProps), props: newProps }
  },
  commitUpdate(node, payload) {
    const { hasChanged, props } = payload
    if (hasChanged) {
      updateNode(node, props)
    }
  },
  commitTextUpdate(text, _, newText) {
    updateText(text, newText)
  },
  // We can ignore for now
  appendChild(parent, instance) {
    parent.children.push(instance)
    updateNode(parent, parent.props)
  },
  getChildHostContext() { return undefined as any },
  shouldSetTextContent: () => { return undefined as any },
  prepareForCommit: () => { return undefined as any },
  preparePortalMount: () => { },
  clearContainer: () => { },
  resetAfterCommit() { },
  resetTextContent() { },
  hideTextInstance() { },
  unhideTextInstance() { },
  getPublicInstance: () => { },
  hideInstance(...args) {
    console.log("hideInstance =>", args)
  },
  unhideInstance() { },
  insertBefore: (parent, child, beforeChild) => {
    console.log("TODO: insertBefore =>", { parent, child, beforeChild })
  },
  finalizeInitialChildren() { return false },
  getCurrentEventPriority: () => DefaultEventPriority,
  beforeActiveInstanceBlur() { },
  afterActiveInstanceBlur() { },
  detachDeletedInstance() { },
  getInstanceFromNode: () => { return undefined as any },
  prepareScopeUpdate() { },
  getInstanceFromScope: () => { return undefined as any },
  insertInContainerBefore: () => { },
  removeChildFromContainer() { },
  removeChild(...args) {
    console.log("removeChild =>", args)
  },
  isPrimaryRenderer: true,
  supportsMutation: true,
  supportsPersistence: false,
  supportsHydration: false,
  scheduleTimeout: setTimeout,
  cancelTimeout: clearTimeout,
  noTimeout: -1,

});

export default function render(app: unknown, root: Root) {
  subscribeToEvents()
  const container = reconcilier.createContainer(
    root,
    0,
    null,
    false,
    null,
    'id',
    () => null,
    null
  )
  return reconcilier.updateContainer(app as any, container, null, () => null)
}
```
