#

##
![](yamsLogo.png){ style="border:0; width:30.0%" }

##
![](portal_screenshot.png){ width=70% }

## 
![](yams_image_test.jpeg)
```json
{
    "format": "webp",
    "watermark": {
        "location": "north",
        "margin": "20px",
        "dimension": "20%"
    },
    "actions": [
        {
            "resize": {
                "width": 300,
                "fit": {
                    "type": "clip"
                }
            }
        }
    ],
    "quality": 90
}
```

## Why not offline transformations?

Lots of (user) contents given the classified business. 
Sites are dynamic by nature. Some of them do adapt the request to the device.
Blocking redesigns or improvements because lack of capacity to reprocess


## This may sound familiar to you...

CDNs able to transform contents:
* *?

SaaS solutions:
* imgix
* libpixel
* Cloudinary

Opensource solutions:
* [Imbo](https://github.com/imbo/imbo)
* [imaginary](https://github.com/h2non/imaginary)
* [picfit](https://github.com/thoas/picfit)


## So why?

* Sites where doing already that. So saving sites time
* Close to the Schibsted sites
    * not just latency (multiregion); also feature-set, compliance...
* Cost effective
* Adapting to other needs:
    * Document transformation
    * Video streaming


