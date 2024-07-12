[← Back](./3-api-reference.md) 

# 4. Guides
- [Creating custom bindings](4-guides.md#creating-custom-bindings)

## Creating custom bindings
Example:
```typescript
export default {
  bindings: [
    {
      key: 'x',
      command: 'kill-window'
    },
    {
      key: 'h',
      command: 'select-pane',
      options: ['-L']
    }
  ]
}
```
