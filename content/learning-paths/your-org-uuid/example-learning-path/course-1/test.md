---
title: 'Course Test'
pass_percentage: 70
questions:
  - id: 'q1'
    text:
      'Which Layer5 project is used for visual design in Kubernetes and cloud
      native infrastructure?'
    type: 'single-answer'
    marks: 2
    options:
      - id: 'a'
        text: 'Meshery'
      - id: 'b'
        text: 'Kanvas'
        is_correct: true
      - id: 'c'
        text: 'Istio'
      - id: 'd'
        text: 'Docker'
  - id: 'q2'
    text: 'Which of the following are architectural components of Meshery?'
    type: 'multiple-answers'
    marks: 2
    options:
      - id: 'a'
        text: 'MeshSync'
        is_correct: true
      - id: 'b'
        text: 'Broker'
        is_correct: true
      - id: 'c'
        text: 'Operator'
        is_correct: true
      - id: 'd'
        text: 'Docker Engine'
  - id: 'q3'
    text: 'Which tool manages Kubernetes namespace labeling?'
    type: 'short-answer'
    marks: 2
    correct_answer: 'kubectl'
  - id: 'q4'
    text:
      'True or False: Containers provide better resource isolation than virtual
      machines.'
    type: 'true-false'
    marks: 1
    answer: false
  - id: 'q5'
    text: 'True or False: Docker uses Linux namespaces for process isolation.'
    type: 'true-false'
    marks: 1
    answer: true
type: 'test'
---
