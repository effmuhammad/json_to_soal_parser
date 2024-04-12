# json_to_soal_parser

A new Flutter project.

<b:text>  :  Bold
<u:text>  :  Underline
<i:text>  :  Italic
<s:text>  :  Strikethrough
<img:path_to_your_image.jpg>
<img:https://example.com/path_to_your_image.jpg>



Example json:
```
[
    {
        "jawaban": "a",
        "pembahasan": [
            "a adalah jawaban yang benar",
            "pembahasan line 2"
        ],
        "pertanyaan": [
            "soal line 1", 
            "soal line 2", 
            "soal line 3"
        ],
        "pilihan": {
            "a": [
                "pilihan a line 1",
                "pilihan a line 2"
            ],
            "b": [
                "pilihan b line 1",
                "pilihan b line 2"
            ],
            "c": [
                "pilihan c line 1",
                "pilihan c line 2"
            ],
            "d": [
                "pilihan d line 1",
                "pilihan d line 2"
            ]
        }
    },
    {
        "jawaban": "b",
        "pembahasan": [
            "b adalah jawaban yang benar"
        ],
        "pertanyaan": [
            "soal line 1", 
            "soal line 2", 
            "soal line 3"
        ],
        "pilihan": {
            "a": [
                "pilihan a line 1",
                "pilihan a line 2"
            ],
            "b": [
                "pilihan b line 1",
                "pilihan b line 2"
            ],
            "c": [
                "pilihan c line 1",
                "pilihan c line 2"
            ],
            "d": [
                "pilihan d line 1",
                "pilihan d line 2"
            ]
        }
    }
]
```