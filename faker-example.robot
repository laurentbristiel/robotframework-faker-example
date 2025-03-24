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
    ${profile} =  Catenate
    ...             ${\n}=======================================
    ...             ${\n}first_name: ${first_name}
    ...             ${\n}last_name: ${last_name}
    ...             ${\n}address: ${address}
    ...             ${\n}country: ${country}
    ...             ${\n}email: ${email}
    ...             ${\n}phone_number: ${phone_number}
    ...             ${\n}=======================================
    Log To Console  ${profile}

another_user_profile
    ${given_name} =  FakerLibrary.first_name
    ${sn} =  FakerLibrary.last_name
    ${user_id} =  set variable  ${given_name}${sn}
    ${mail} =  FakerLibrary.email
    ${phone_number} =  FakerLibrary.Numerify  +%%-%%%%-%%%%
    ${description} =  FakerLibrary.Sentence
    ${password} =  FakerLibrary.Password
    ${profile} =  Catenate
    ...             ${\n}=======================================
    ...             ${\n}given_name: ${given_name}
    ...             ${\n}sn: ${sn}
    ...             ${\n}user_id: ${user_id}
    ...             ${\n}mail: ${mail}
    ...             ${\n}phone_number: ${phone_number}
    ...             ${\n}description: ${description}
    ...             ${\n}password: ${password}
    ...             ${\n}=======================================
    Log To Console  ${profile}

yet_another_user_profile_with_groups
    GROUP  Prepare data elements
        ${given_name} =  FakerLibrary.first_name
        ${sn} =  FakerLibrary.last_name
        ${user_id} =  set variable  ${given_name}${sn}
        ${mail} =  FakerLibrary.email
        ${phone_number} =  FakerLibrary.Numerify  +%%-%%%%-%%%%
        ${description} =  FakerLibrary.Sentence
        ${password} =  FakerLibrary.Password
    END
    GROUP  Prepare final data
        ${profile} =  Catenate
        ...             ${\n}=======================================
        ...             ${\n}given_name: ${given_name}
        ...             ${\n}sn: ${sn}
        ...             ${\n}user_id: ${user_id}
        ...             ${\n}mail: ${mail}
        ...             ${\n}phone_number: ${phone_number}
        ...             ${\n}description: ${description}
        ...             ${\n}password: ${password}
        ...             ${\n}=======================================
        Log To Console  ${profile}
    END

misc_keywords
    ${safe_email} =  FakerLibrary.Safe_Email
    ${timezone} =  FakerLibrary.Timezone
    ${url} =  FakerLibrary.url
    ${misc} =  Catenate
    ...             ${\n}Safe Email: ${safe_email}
    ...             ${\n}timezone: ${timezone}
    ...             ${\n}url: ${url}
    Log To Console  ${misc}

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
    ${browsers} =  Catenate
    ...             ${\n}=======================================
    ...             ${\n}${chrome}
    ...             ${\n}${firefox}
    ...             ${\n}${internet_explorer}
    ...             ${\n}=======================================
    Log To Console  ${browsers}

country_locale
    ${Language_code} =  FakerLibrary.Language_code
    ${Locale} =  FakerLibrary.Locale
    ${output} =  Catenate
    ...             ${\n}Language_code: ${Language_code}
    ...             ${\n}Locale: ${Locale}
    Log To Console  ${output}

generate_csv_file
    ${string} =  set variable  "firstName", "uid", "lastName", "email", "employeeNumber"${\n}
    FOR  ${i}  IN RANGE  3
      ${given_name} =  FakerLibrary.first_name
      ${last_name} =  FakerLibrary.last_name
      ${uid} =  set variable  ${given_name}${last_name}
      ${email} =  FakerLibrary.email
      ${employee_number} =  FakerLibrary.Numerify  %%%%%%
      ${string} =  Catenate  ${string}
    ...  "${given_name}", "${last_name}", "${uid}", "${email}", "${employee_number}"${\n}
    END
    Log To Console  ${string}
    # and then you can create the file with the string:
    # create file  /path/to/Installs/openidm/samples/sample4/data/hr.csv  ${string}