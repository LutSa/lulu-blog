module ProcessIndex exposing (view)


import Element exposing (Element)

import Element.Background
import Element.Border
import Element.Font as Font
import Pages
import Pages.ImagePath as ImagePath
import Palette



view model =
    [ inProcess
    , done
    ]
    |> Element.row
        [ Element.width Element.fill
        , Element.spacing 10
        , Element.centerX
        ]


header text=
    Element.text text
    |> Element.el
         [ Element.width Element.fill
         , Element.centerX
         , Element.centerX
         , Font.extraBold
         , Font.size 28
         , Font.color (Element.rgba255 0 0 0 0.7)
         ]

boardEl color=
    Element.column
    [ Element.width Element.fill
    , Element.spacing 30
    , Element.height Element.fill
    , Element.padding 10
    , Element.Border.width 1
    , Element.alignTop
    , Element.scrollbars
    , Element.Background.color color
    , Element.Border.color (Element.rgba255 0 0 0 0.1)
    , Element.mouseOver
    [ Element.Border.color (Element.rgba255 0 0 0 0.2)]
    ]

cardEl color a=
    Element.paragraph
            [ Element.width Element.fill
            , Element.height <| Element.px 200
            , Element.Background.color color
            , Element.padding 8
            , Font.extraLight
            , Font.color (Element.rgba255 0 0 0 0.7)
            , Element.Border.shadow
                                  { offset = ( 1, 2 )
                                  , blur = 1
                                  , size = 2
                                  , color = Element.rgb (238 / 255) (238 / 255) (238 / 255)
                                  }
            , Element.mouseOver
                [  Element.Border.shadow
                                                    { offset = ( 2, 4 )
                                                    , blur = 1
                                                    , size = 4
                                                    , color = Element.rgb (238 / 255) (238 / 255) (238 / 255)
                                                    }]

            ]
            [a]

todoCard text=
    cardEl (Element.rgb255 255 255 255) (Element.text text)



inProcessCard text url =
    cardEl (Element.rgba255 240 242 250 0.3) (Element.link []
                                                  { url = url
                                                  , label = Element.text text
                                                  } )

inProcess : Element msg
inProcess =
    boardEl (Element.rgb255 255 255 255)
        [ header "TO DO (Unfinished Discussions)"
                    , inProcessCard "Spec for HTML Inlines vs. HTML Blocks" "https://github.com/dillonkearns/elm-markdown/discussions/102"
                    , inProcessCard "Explicit Specification for elm-markdown's HTML Parsing Markdown Extension" "https://github.com/dillonkearns/elm-markdown/discussions/99"
                    , inProcessCard "HTML Fallback Handling" "https://github.com/dillonkearns/elm-markdown/discussions/93"
                    , inProcessCard "The previous compiler list length issue in entity parsing" "https://github.com/dillonkearns/elm-markdown/discussions/90"
                    ]

doneCard text url=
    cardEl (Element.rgb255 255 255 255) (Element.link []
                                                                                          { url = url
                                                                                          , label = Element.text text
                                                                                          } )

done : Element msg
done =
    boardEl (Element.rgba255 240 242 250 0.3)
            [ header "Done (Merged Code)"
            , doneCard "Improve list item parsing and indented code blocks parsing" "https://github.com/dillonkearns/elm-markdown/pull/88"
            , doneCard "Fix failing case of nested link references by making rawBlockParser recursive" "https://github.com/dillonkearns/elm-markdown/pull/84"
            , doneCard "Fix minor emphasis parsing cases" "https://github.com/dillonkearns/elm-markdown/pull/82"
            , doneCard "Fix minor heading parsing cases related to whitespace" "https://github.com/dillonkearns/elm-markdown/pull/77"
            ]