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

* *Lots of (user) contents*. Reprocessing hurts
* *Sites are dynamic* by nature. Some of them do adapt the content to the device.

## This may sound familiar to you...

CDNs able to transform contents on the fly:

* As a native functionality...
* Or through lambdas / edge computing

##

SaaS solutions:

* [imgix](https://www.imgix.com/)
* [LibPixel](https://libpixel.com/)
* [Cloudinary](https://cloudinary.com/)

##

Opensource solutions:

* [Imbo](https://github.com/imbo/imbo)
* [imaginary](https://github.com/h2non/imaginary)
* [picfit](https://github.com/thoas/picfit)

