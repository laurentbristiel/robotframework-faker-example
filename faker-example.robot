*** Settings ***
Library  FakerLibrary

*** Test Cases ***
Faker_profile
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

Faker_seeding
    # working only with master of FakerLibrary
    FakerLibrary.Seed  ${5}
    ${name1} =  FakerLibrary.email
    FakerLibrary.Seed  ${5}
    ${name2} =  FakerLibrary.email
    Should Be Equal As Strings  ${name1}  ${name2}

browsers
    # not sure to understand the results...
    ${chrome} =  FakerLibrary.chrome
    ${firefox} =  FakerLibrary.firefox
    ${internet_explorer} =  FakerLibrary.Internet_explorer
    ${browsers} =  catenate
    ...             ${\n}=======================================
    ...             ${\n}${chrome}
    ...             ${\n}${firefox}
    ...             ${\n}${internet_explorer}
    ...             ${\n}=======================================
    log to console  ${browsers}