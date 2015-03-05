# Robot Framework Fakerlibrary Examples

Set of examples of Robot Framework Faker Library usage.

This library generates random data to be used in test cases.

Resources for the library:
- [Library source code](https://github.com/guykisel/robotframework-faker)
- [Keywords documentation](https://guykisel.github.io/robotframework-faker/)

Usage:

1. install Robot Framework and RF Faker Library
    - `pip install robotframework`
    - `pip install robotframework-faker`

2. launch Robot tests
    - whole suite: `pybot faker-example.robot`
    - specific test: `pybot --test country_locale faker-example.robot`
    

For example, this test:

```
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
```
produce an output similar to this:

```
$ pybot --test Faker_profile faker-example.robot
=======================================
Faker-Example
=======================================
Faker_profile                   .......
=======================================
first_name: Trevon
last_name: Nader
address: PSC 4099, Box 8542
APO AE 43357
country: Tokelau
email: renner.bridgette@greenholt.info
phone_number: 484.461.9307x600
=======================================
Faker_profile                  | PASS |
---------------------------------------
```