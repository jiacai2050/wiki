# OQL

```
SELECT * FROM java.lang.String s
         WHERE ( s.count > 1000 ) = true
         WHERE toString(s) = "monday"
         WHERE dominators(s).size() = 0
         WHERE s.@retainedHeapSize > 1024L
         WHERE s.value != null AND s.value.@valueArray.@length >= 1 AND s.value.@valueArray.get(0) = 'j'
         WHERE s.@GCRootInfo != null
```
- https://help.eclipse.org/neon/index.jsp?topic=%2Forg.eclipse.mat.ui.help%2Freference%2Foqlsyntax.html

