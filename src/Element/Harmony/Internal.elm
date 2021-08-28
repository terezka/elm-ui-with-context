module Element.Harmony.Internal exposing (Attr(..), Attribute, Color, Decoration, Element(..), attr, attribute, attributes, run, runAttr, wrapAttrs, wrapContainer)

import Element


type alias Color =
    Element.Color


type alias Attribute context msg =
    Attr context () msg


type Attr context decorative msg
    = Attribute (context -> Element.Attr decorative msg)


type alias Decoration context =
    Attr context Never Never


type Element context msg
    = Element (context -> Element.Element msg)


attribute : Element.Attribute msg -> Attribute context msg
attribute a =
    Attribute <| \_ -> a


attr : Element.Attr decorative msg -> Attr context decorative msg
attr a =
    Attribute <| \_ -> a


attributes : context -> List (Attribute context msg) -> List (Element.Attribute msg)
attributes context attrs =
    List.map (\(Attribute f) -> f context) attrs


wrapAttrs :
    (List (Element.Attribute msg) -> child -> Element.Element msg)
    -> (context -> childHarmony -> child)
    -> List (Attribute context msg)
    -> childHarmony
    -> Element context msg
wrapAttrs ctor f attrs child =
    Element <| \context -> ctor (attributes context attrs) (f context child)


wrapContainer :
    (List (Element.Attribute msg) -> List (Element.Element msg) -> Element.Element msg)
    -> List (Attribute context msg)
    -> List (Element context msg)
    -> Element context msg
wrapContainer container attrs children =
    Element <| \context -> container (attributes context attrs) (List.map (run context) children)


run : context -> Element context msg -> Element.Element msg
run context (Element f) =
    f context


runAttr : context -> Attr context decorative msg -> Element.Attr decorative msg
runAttr context (Attribute f) =
    f context
