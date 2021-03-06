utility
create12Version
  self createNested12Baseline.
  (MetacelloToolBox configurationNamed: self configurationName asString)
    createVersionMethod: 'version12:' inCategory: 'versions' forVersion: '1.2';
    importFrom: '1.2-baseline'
      updateProjects: true
      updatePackages: true
      versionSpecsDo: [ :attributeOrPath :versionSpec | 
        attributeOrPath == #'common'
          ifTrue: [ versionSpec blessing: #'development' ].
        attributeOrPath = #(#(#'common') #(#'nested')) asMetacelloAttributePath
          ifTrue: [ versionSpec description: 'nested for:do: section' ].
        true ];
    commitMethod