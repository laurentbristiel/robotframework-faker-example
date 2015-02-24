*** Settings ***
Library  FakerLibrary

*** Test Cases ***
user_profile
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

openidm_user_profile
    ${given_name} =  FakerLibrary.first_name
    ${sn} =  FakerLibrary.last_name
    ${user_id} =  set variable  ${given_name}${sn}
    ${mail} =  FakerLibrary.email
    ${phone_number} =  FakerLibrary.Numerify  +%%-%%%%-%%%%
    ${description} =  FakerLibrary.Sentence
    ${password} =  FakerLibrary.Password
    ${profile} =  catenate
    ...             ${\n}=======================================
    ...             ${\n}given_name: ${given_name}
    ...             ${\n}sn: ${sn}
    ...             ${\n}user_id: ${user_id}
    ...             ${\n}mail: ${mail}
    ...             ${\n}phone_number: ${phone_number}
    ...             ${\n}description: ${description}
    ...             ${\n}password: ${password}
    ...             ${\n}=======================================
    log to console  ${profile}

misc_keywords
    ${safe_email} =  FakerLibrary.Safe_Email
    ${timezone} =  FakerLibrary.Timezone
    ${url} =  FakerLibrary.url
    ${misc} =  catenate
    ...             ${\n}Safe Email: ${safe_email}
    ...             ${\n}timezone: ${timezone}
    ...             ${\n}url: ${url}
    log to console  ${misc}

Faker_seeding
    FakerLibrary.Seed  ${5}
    ${name1} =  FakerLibrary.email
    FakerLibrary.Seed  ${5}
    ${name2} =  FakerLibrary.email
    Should Be Equal As Strings  ${name1}  ${name2}

browsers
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

country_locale
    ${Language_code} =  FakerLibrary.Language_code
    ${Locale} =  FakerLibrary.Locale
    ${output} =  catenate
    ...             ${\n}Language_code: ${Language_code}
    ...             ${\n}Locale: ${Locale}
    log to console  ${output}