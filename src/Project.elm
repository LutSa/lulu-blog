module Project exposing (view)


import Element exposing (Element)

import Element.Border
import Element.Font as Font
import Pages
import Pages.ImagePath as ImagePath
import Palette


view : Element msg
view  = Element.column [Element.spacing 30][ project1Link, project2Link]


project1Link : Element msg
project1Link =
    Element.el[ Element.Border.width 1
                       , Element.Border.color (Element.rgba255 0 0 0 0.1)
                       ,Element.mouseOver
                                                       [ Element.Border.color (Element.rgba255 0 0 0 1)
                                                       ]]

    (Element.newTabLink
            []
            { url = "https://vg100-p1-xuan.netlify.com/"
            , label =
                Element.image
                    [ Element.width (Element.fill|>Element.maximum 800)
                    , Font.color Palette.color.primary
                    ]
                    { src = ImagePath.toString Pages.images.project1, description = "Github repo" }

            })



project2Link : Element msg
project2Link =Element.el[ Element.Border.width 1
                                     , Element.Border.color (Element.rgba255 0 0 0 0.1)
                                     ,Element.mouseOver
                                                                     [ Element.Border.color (Element.rgba255 0 0 0 1)
                                                                     ]]

                  (
    Element.newTabLink
        [Element.mouseOver
                                    [ Element.Border.color (Element.rgba255 0 0 0 1)
                                    ]]
        { url = "https://vg100-p2-xuan.netlify.com/"
        , label =
            Element.image
                [ Element.width (Element.fill|>Element.maximum 800)
                , Font.color Palette.color.primary
                ]
                { src = ImagePath.toString Pages.images.project2, description = "Github repo" }
        })