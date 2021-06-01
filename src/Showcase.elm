module Showcase exposing (..)

import Pages.Secrets as Secrets
import Json.Decode as Decode exposing (Decoder)


type alias Entry =
    { screenshotUrl : String
    , displayName : String
    , liveUrl : String
    , authorName : String
    , authorUrl : String
    , categories : String
    , repoUrl : Maybe String
    }


decoder : Decoder (List Entry)
decoder =
    Decode.field "records" <|
        Decode.list entryDecoder


entryDecoder : Decoder Entry
entryDecoder =
    Decode.field "fields" <|
        Decode.map7 Entry
            (Decode.field "Screenshot URL" Decode.string)
            (Decode.field "Site Display Name" Decode.string)
            (Decode.field "Live URL" Decode.string)
            (Decode.field "Author" Decode.string)
            (Decode.field "Author URL" Decode.string)
            (Decode.field "Categories" Decode.string)
            (Decode.maybe (Decode.field "Repository URL" Decode.string))



