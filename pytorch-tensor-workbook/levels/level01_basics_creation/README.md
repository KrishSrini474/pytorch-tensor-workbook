Run directly                      Import as module
-------------                     ----------------
__name__ = "__main__"             __name__ = "my_script"
     |                                      |
  condition True → run block          condition False → skip block
python my_script.py
1.Python starts → loads my_script.py
        |
        v
__name__ = "__main__"
        |
        v
if __name__ == "__main__":   ✅ True
        |
        v
main() is called
2.import my_script
Python loads my_script.py as a module
        |
        v
__name__ = "my_script"
        |
        v
if __name__ == "__main__":   ❌ False
        |
        v
Block is skipped
