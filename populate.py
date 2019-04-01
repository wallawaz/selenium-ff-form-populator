import argparse
from selenium import webdriver
import sys

DEFAULT_WEBPAGE = "http://demo.guru99.com/test/login.html"
DEFAULT_INPUT_VALUE = 600000

parser = argparse.ArgumentParser()
parser.add_argument("web_url", help="url to hit",
                    default=DEFAULT_WEBPAGE)
parser.add_argument("populate_value", help="value to populate forms with",
                    type=int, default=DEFAULT_INPUT_VALUE)

def is_hidden(web_element):
    _class = web_element.get_attribute("class").lower()
    _type = web_element.get_attribute("type").lower()
    return _class == "hidden" or _type == "hidden"


def all_input_forms(driver):
    return driver.find_elements_by_xpath("//form")

def input_value(form, value):
    for i in form.find_elements_by_xpath("//input"):
        if is_hidden(i):
            continue

        try:
            i.clear()
            i.send_keys(value)
        except Exception as e:
            print(e)
            pass

def find_submit_button(form):
    global SUBMIT_BUTTON
    if SUBMIT_BUTTON is not None:
        return
    btn = form.find_element_by_xpath("//button")
    if btn:
        SUBMIT_BUTTON = btn


if __name__ == "__main__":
    args = parser.parse_args()

    driver = webdriver.Firefox()
    driver.get(args.web_url)

    for form in all_input_forms(driver):
        input_value(form, args.populate_value)
        find_submit_button(form)

    if SUBMIT_BUTTON is not None:
        print("submitting")
        SUBMIT_BUTTON.click()
