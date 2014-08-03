# osf-export-templates
[Handlebars](http://handlebarsjs.com/)-templates for various osf export formats. They
all accept a special format of shownotes which is documented below. There are
handlebar-libs available for many languages, including [php](https://github.com/mardix/Handlebars), [python](https://github.com/wbond/pybars) and
[javascript](http://handlebarsjs.com/) of course.

## Distribution
This repository is published to both npm and bower as `osf-export-templates`.

## Structure
Each format is contained in its own directory. The name of the directory is also the
primary name of the format. Each directory must contain a `main.hbs` which will be
used as the root. It may contain additional templates which are loaded as partials.
They can be accessed using `{{>partial-name}}`, which is covered in detail in the
[handlebars-documentation](http://blog.teamtreehouse.com/handlebars-js-part-2-partials-and-helpers).

## Format
The following is the data-structure which is expected by all templates. It is
presented in json here, but is of course the same in all supported languages.
For example dicts in python or key-value-arrays in php.

```json
{
  "notes": [
    {
      "time": "00:01:50.000",
      "time_seconds": 110,
      "time_milliseconds": 110000,
      "time_uniq": "00:01:50.000",
      "time_uniq_seconds": 110,
      "time_uniq_milliseconds": 110000,
      "text": "google",
      "link": "http://google.com",
      "tags": {
        "chapter": true
      },
      "depth": 0,
      "notes":[
        {
          "time":"",
          "time_uniq":"00:01:50.003",
          "time_uniq_seconds": 110,
          "time_uniq_milliseconds": 110003,
          "text":"A.1",
          "link":"",
          "tags":{},
          "depth": 1,
          "notes":[]
        }
      ]
    }
  ]
}
```

### `time_*` and `time_uniq_*`
The time must always be presented in 3 formats, `HH:MM:SS.FFF`, seconds and milliseconds.
If the time of the current note is the same as the one of the last note, `time_uniq` must
contain the last time pluse one millisecond. The value of `time_uniq` must be unique.

### `tags`
Tags are represented by a object whose keys are the tag-names which a truthy value like
`true` or `1`.

### `depth`
The current nesting level, as a number, starting at `0` is present in `depth`.

### `notes`
Contains all sub-notes of the current note. This attribute must always be present. If
there are no sub-notes it must be an empty array.
