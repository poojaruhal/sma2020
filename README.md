# sma2020

- Project_Analyzer
- Hierarchy_Analyzer

# About
In object-oriented programming langauges, Inheritance plays an important role. The parent-child relationship between classes can reduce the code duplication and enhance the code understanding. However, depending on how we define the class hierarchy, root can vary and thus the way levels are computed.
In this project, we redefine the class hierarchy of Smalltalk by restricting its scope to a project or its package.
It tells where the class lies in the hierarchy chain, a root, an intermediate, or leaf class.

## Usage
For example, based on the scope of the hierarchy, the level of the class PRExportCanvas in the hierarchy chain can vary.

```explorer := HA_ClassExplorer asExplorerClass: PRExportCanvas.

explorer classDepth.

explorer calculatePackageLevel.

explorer calculateProjectLevel.
```
