-- declares that this is the SignupForm module, which is how
-- other modules will reference this one if they want to import it and reuse its code.
module SignupForm where

-- Elm’s "import" keyword works mostly like "require" in node.js.
-- The “exposing (..)” option specifies that we want to bring the Html module’s contents
-- into this file’s current namespace, so that instead of writing out
-- Html.form and Html.label we can just use "form" and "label" without the "Html." prefix.
import Html exposing (..)

-- This works the same way; we also want to import the entire
-- Html.Events module into the current namespace.
import Html.Events exposing (..)

-- With this import we are only bringing a few specific functions into our
-- namespace, specifically "id", "type'", "for", "value", and "class".
import Html.Attributes exposing (id, type', for, value, class)


view model =
    form
        [ id "signup-form" ]
        [ h1 [] [ text "Sensational Signup Form" ]
        , label [ for "username-field" ] [ text "username: " ]
        , input [ id "username-field", type' "text", value model.username ] []
        , div [ class "validation-error" ] [ text model.errors.username ]
        , label [ for "password" ] [ text "password: " ]
        , input [ id "password-field", type' "password", value model.password ] []
        , div [ class "validation-error" ] [ text model.errors.password ]
        , div [ class "signup-button" ] [ text "Sign Up!" ]
        ]


initialErrors =
    { username = "bad username", password = "bad password" }


-- Take a look at this starting model we’re passing to our view function.
-- Note that in Elm syntax, we use = to separate fields from values
-- instead of : like JavaScript uses for its object literals.
main =
    view { username = "", password = "", errors = initialErrors }
