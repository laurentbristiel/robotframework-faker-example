*** Settings ***
Library  FakerLibrary

*** Test Cases ***
Faker_example
    ${address} =  FakerLibrary.address
    ${country} =  FakerLibrary.country
    ${email} =  FakerLibrary.email
    ${first_name} =  FakerLibrary.first_name
    ${last_name} =  FakerLibrary.last_name
    ${phone_number} =  FakerLibrary.phone_number
    ${profile} =  catenate
    ...             ${\n}=======================================
    ...             ${\n}first_name: ${first_name}
    ...             ${\n}last_name: ${last_name}
    ...             ${\n}address: ${address}
    ...             ${\n}country: ${country}
    ...             ${\n}email: ${email}
    ...             ${\n}phone_number: ${phone_number}
    ...             ${\n}=======================================
    log to console  ${profile}