*** Settings ***
Library  FakerLibrary

*** Test Cases ***
Faker_example
    ${words} =  FakerLibrary.Words
    Log to console  ${\n}words: ${words}
    ${words} =  FakerLibrary.Words  nb=${10}
    Log to console  ${\n}words: ${words}