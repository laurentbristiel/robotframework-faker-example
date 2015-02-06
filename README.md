# robotframework-fakerlibrary-example

Example of Robot Framework Faker Library usage.
This library generates random data to be used in test cases.

Resources for the library:
- [Library source code](https://github.com/guykisel/robotframework-faker)
- [Keywords documentation](https://guykisel.github.io/robotframework-faker/)

Usage:

1. install Robot Framework and SSH Library
    - pip install robotframework
    - pip install pip install robotframework-faker

2. launch Robot tests
    - pybot faker-example.robot
    

This test:

.. code:: robotframework

    *** Settings ***
    Library    FakerLibrary

    *** Test Cases ***
    FakerLibrary Words Generation
        ${words}=    FakerLibrary.Words
        Log    words: ${words}
        ${words}=    FakerLibrary.Words    nb=${10}
        Log    words: ${words}

gives this output:

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