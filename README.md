# Robot Framework Fakerlibrary Examples

![GitHub Actions](https://github.com/laurentbristiel/robotframework-faker-example/actions/workflows/robot-tests.yml/badge.svg)

Set of examples of Robot Framework Faker Library usage.

This library generates random data to be used in test cases.

Resources for the library:
- [Library source code](https://github.com/MarketSquare/robotframework-faker)
- [Keywords documentation](https://marketsquare.github.io/robotframework-faker/)

Usage:

1. install Robot Framework and RF Faker Library
    - `python3 -m pip install robotframework`
    - `python3 -m pip install robotframework-faker`

2. launch Robot tests
    - whole suite: `robot faker-example.robot`
    - specific test: `robot --test country_locale faker-example.robot`
    

For example, this test:

```robotframework
    *** Test Cases ***
    Faker_profile
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
```
will produce an output similar to this:

```console
$ robot --test user_profile faker-example.robot
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
or to that:
```console
$ robot --test user_profile faker-example.robot
=======================================
Faker-Example
=======================================
Faker_profile                   .......
=======================================
first_name: Sara
last_name: Gaylord
address: PSC 2996, Box 3404
APO AA 22214
country: Cook Islands
email: luca99@yahoo.com
phone_number: 250.723.9835x7058
=======================================
Faker_profile                  | PASS |
---------------------------------------
```