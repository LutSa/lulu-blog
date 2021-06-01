module Layout exposing (view)

import DocumentSvg
import Element exposing (Element)
import Element.Background
import Element.Border
import Element.Font as Font
import Element.Region
import Html.Attributes exposing (alt, attribute, class, href, src)
import Metadata exposing (Metadata)
import Pages
import Pages.Directory as Directory exposing (Directory)
import Pages.ImagePath as ImagePath
import Pages.PagePath as PagePath exposing (PagePath)
import Palette
import Tailwind.Breakpoints as Bp
import Tailwind.Utilities as Tw
import Showcase
import Css exposing (..)
import Html exposing (..)
import Html.Styled.Attributes exposing (css)
view :
    { title : String, body : List (Element msg) }
    ->
        { path : PagePath Pages.PathKey
        , frontmatter : Metadata
        }
    -> { title : String, body : Html msg }
view document page =
    { title = document.title
    , body = Element.column [ Element.centerX
                             , Element.centerY
                             , Element.Background.color (Element.rgba255 240 242 245 0.502)
                             , Element.width Element.fill
                             , Element.paddingEach { top=50, right=80, bottom=0, left=80 }
                            ]
                    [ buttons page.path
                    , Element.row
                                 [ Element.width Element.fill
                                 , Element.Background.color (Element.rgb255 255 255 255)
                                 , Element.Border.roundEach
                                       { topLeft = 50
                                       , topRight = 0
                                       , bottomLeft = 50
                                       , bottomRight = 50
                                       }
                                 , Element.centerX
                                 ]
                                 [ sider
                                 , pageBody document.body
                                 ]

                    ]
                                     |> Element.layout
                                          [ Element.width Element.fill
                                          , Font.size 20
                                          , Font.family [ Font.typeface "Roboto" ]
                                          , Font.color (Element.rgba255 0 0 0 0.8)
                                          ]




    }

buttons currentPath=
     Element.row [ Element.spacing 15
                 , Element.alignRight
                 , Element.paddingXY 200 10
                 , Element.Background.color (Element.rgb255 255 255 255)
                 , Element.Border.roundEach
                                      { topLeft = 250
                                      , topRight = 100
                                      , bottomLeft = 0
                                      , bottomRight= 0
                                      }
                 ]
                      [ processLink currentPath
                      , highlightableLink currentPath Pages.pages.blog.directory "Blog"
                      , projectLink currentPath
                      ]

pageBody body=  Element.column
    [ Element.padding 30
    , Element.spacing 40
    , Element.Region.mainContent
    , Element.width (Element.fill |> Element.maximum 800)
    , Element.Background.color (Element.rgb 12 11 11)
    , Element.height Element.fill
    , Element.Border.rounded 50
    , Element.centerX
    ]
    body


sider: Element msg
sider =
    Element.column
        [ Element.spacing 30
        , Element.centerY
        , Element.Background.color (Element.rgb 12 11 11)
        , Element.padding 50
        , Element.height Element.fill
        , Element.Border.rounded 50
        ]

    [avatar, name, title, githubLink]


avatar: Element msg
avatar =
    Element.el
        [ Element.Border.rounded 50
        , Element.Background.image (ImagePath.toString Pages.images.avatar)
        , Element.width <| Element.px 200
        , Element.height <| Element.px 200
        , Element.centerX
        , Element.Border.shadow
                      { offset = ( 1, 2 )
                      , blur = 1
                      , size = 2
                      , color =
                              Element.rgb (238 / 255) (238 / 255) (238 / 255)
                      }
        ]
        Element.none

name = Element.row[ Font.size 32, Element.centerX, Element.spacing 10]
        [ Element.el [Font.extraLight] (Element.text "Jinyi")
        , Element.el [Font.extraBold] (Element.text "WU")]

title = Element.column
            [Element.centerX]
            [ Element.text "GSoC21' student"
            , Element.text" @elm-tooling"]

githubLink : Element msg
githubLink =
    Element.newTabLink [Element.centerX]
        { url = "https://github.com/LutSa"
        , label =
            Element.image
                [ Element.width (Element.px 22)
                , Font.color Palette.color.primary
                ]
                { src = ImagePath.toString Pages.images.github, description = "Github repo" }
        }

highlightableLink :
    PagePath Pages.PathKey
    -> Directory Pages.PathKey Directory.WithIndex
    -> String
    -> Element msg
highlightableLink currentPath linkDirectory displayName =
    let
        isHighlighted =
            currentPath |> Directory.includes linkDirectory
    in
    Element.link
        (if isHighlighted then
            [Element.Background.color (Element.rgb255 186 85 211)
            , Element.Border.rounded 20
            , Font.color (Element.rgba255 255 255 255 0.7)
            , Element.padding 10
            , Font.size 30
            , Element.Border.shadow
                                  { offset = ( 1, 2 )
                                  , blur = 1
                                  , size = 2
                                  , color =
                                          Element.rgba (186 / 255) (85 / 255) (238 / 211) 0.5
                                  }
            ]

         else
            [ Font.size 30
            , Element.padding 10
            , Font.color (Element.rgb255 117 119 120)]
        )
        { url = linkDirectory |> Directory.indexPath |> PagePath.toString
        , label = Element.text displayName
        }


githubRepoLink : Element msg
githubRepoLink =
    Element.newTabLink []
        { url = "https://github.com/dillonkearns/elm-pages"
        , label =
            Element.image
                [ Element.width (Element.px 22)
                , Font.color Palette.color.primary
                ]
                { src = ImagePath.toString Pages.images.github, description = "Github repo" }
        }

projectLink currentPath=
    if currentPath == Pages.pages.project then
        Element.link
                [ Element.Background.color (Element.rgb255 186 85 211)
                              , Element.Border.rounded 20
                              , Font.color (Element.rgba255 255 255 255 0.7)
                              , Element.padding 10
                              , Font.size 30
                              , Element.Border.shadow
                                                                { offset = ( 1, 2 )
                                                                , blur = 1
                                                                , size = 2
                                                                , color =
                                                                        Element.rgba (186 / 255) (85 / 255) (238 / 211) 0.5
                                                                }
                ]
                { url = "/project"
                , label = Element.text "Game"
                }
    else
        Element.link
                [  Font.size 30
                                , Element.padding 10
                                , Font.color (Element.rgb255 117 119 120)
                ]
            { url = "/project"
                    , label = Element.text "Game"
                    }

processLink currentPath=
    if currentPath == Pages.pages.process then
        Element.link
                [ Element.Background.color (Element.rgb255 186 85 211)
                              , Element.Border.rounded 20
                              , Font.color (Element.rgba255 255 255 255 0.7)
                              , Element.padding 10
                              , Font.size 30
                              , Element.Border.shadow
                                                                { offset = ( 1, 2 )
                                                                , blur = 1
                                                                , size = 2
                                                                , color =
                                                                        Element.rgba (186 / 255) (85 / 255) (238 / 211) 0.5
                                                                }
                ]
                { url = "/process"
                , label = Element.text "Process"
                }
    else
        Element.link
                [  Font.size 30
                , Element.padding 10
                , Font.color (Element.rgb255 117 119 120)
                ]
            { url = "/process"
                    , label = Element.text "Process"
                    }


elmDocsLink : Element msg
elmDocsLink =
    Element.newTabLink []
        { url = "https://package.elm-lang.org/packages/dillonkearns/elm-pages/latest/"
        , label =
            Element.image
                [ Element.width (Element.px 22)
                , Font.color Palette.color.primary
                ]
                { src = ImagePath.toString Pages.images.elmLogo, description = "Elm Package Docs" }
        }



showcaseHardcode: List
    { screenshotUrl : String
    , displayName : String
    , liveUrl : String
    , authorName : String
    , authorUrl : String
    , categories : String
    , repoUrl : Maybe String
    }
showcaseHardcode =
    [{ screenshotUrl = "../images/author/dillon.jpg"
    , displayName = "Xuan"
    , liveUrl = "github.com"
    , authorName = "Lulu"
    , authorUrl = "github.com"
    , categories = "s"
    , repoUrl = Just "github.com"
    }]


showcaseEntries :Html msg
showcaseEntries  =
    ul
        [
        ]
        (showcaseHardcode
            |> List.map showcaseItem
        )



showcaseItem : Showcase.Entry -> Html msg
showcaseItem item =
    li
        []
        [ div []
            [ img
                [ src (item.screenshotUrl)
                , alt ""
                , attribute "loading" "lazy"
                ]
                []
            ]
        , a
            [ href item.liveUrl
            ]
            [ text item.displayName ]
        , a
            [ href item.authorUrl
            ]
            [ text item.authorName ]
        ]


topSection : Html msg
topSection =
    div
        [
        ]
        [ div
            [
            ]
            [ h2
                [
                ]
                [ span
                    [
                    ]
                    [ text "elm-pages Showcase" ]
                ]
            , p
                [
                ]
                [ text "Check out some projects from the elm-pages community." ]
            , a
                [ href "https://airtable.com/shrPSenIW2EQqJ083"

                ]
                [ text "Submit your site to the showcase" ]
            ]
        ]