cwlVersion: v1.0
steps:
  read-potential-cases-i2b2:
    run: read-potential-cases-i2b2.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  lupus-erythematosus-local-and-systemic-disseminated---primary:
    run: lupus-erythematosus-local-and-systemic-disseminated---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-i2b2/output
  discoid-lupus-erythematosus-local-and-systemic---primary:
    run: discoid-lupus-erythematosus-local-and-systemic---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: lupus-erythematosus-local-and-systemic-disseminated---primary/output
  lupus-erythematosus-local-and-systemic---primary:
    run: lupus-erythematosus-local-and-systemic---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: discoid-lupus-erythematosus-local-and-systemic---primary/output
  lupus---primary:
    run: lupus---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: lupus-erythematosus-local-and-systemic---primary/output
  other-lupus-erythematosus-local-and-systemic---primary:
    run: other-lupus-erythematosus-local-and-systemic---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: lupus---primary/output
  lupus-erythematosus-local-and-systemic-libmansacks---primary:
    run: lupus-erythematosus-local-and-systemic-libmansacks---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: other-lupus-erythematosus-local-and-systemic---primary/output
  lupus-erythematosus-local-and-systemic-measure---primary:
    run: lupus-erythematosus-local-and-systemic-measure---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: lupus-erythematosus-local-and-systemic-libmansacks---primary/output
  lupus-erythematosus-local-and-systemic-activity---primary:
    run: lupus-erythematosus-local-and-systemic-activity---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: lupus-erythematosus-local-and-systemic-measure---primary/output
  lupus-erythematosus-local-and-systemic---secondary:
    run: lupus-erythematosus-local-and-systemic---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: lupus-erythematosus-local-and-systemic-activity---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: lupus-erythematosus-local-and-systemic---secondary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
