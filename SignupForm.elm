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

import StartApp
import Effects


view actionDispatcher model =
    form
        [ id "signup-form" ]
        [ h1 [] [ text "Sensational Signup Form" ]
        , label [ for "username-field" ] [ text "username: " ]
        , input [ id "username-field", type' "text", value model.username ] []
        , div [ class "validation-error" ] [ text model.errors.username ]
        , label [ for "password" ] [ text "password: " ]
        , input [ id "password-field", type' "password", value model.password ] []
        , div [ class "validation-error" ] [ text model.errors.password ]
        , div [ class "signup-button", onClick actionDispatcher { actionType = "VALIDATE" } ] [ text "Sign Up!" ]
        ]


initialErrors =
    { username = "", password = "" }


getErrors model =
    { username =
        if model.username == "" then
            "Please enter a username!"
        else
            ""

    , password =
        if model.password == "" then
            "Please enter a password!"
        else
            ""
    }


update action model =
    if action.actionType == "VALIDATE" then
        ({ model | errors <- getErrors model }, Effects.none)
    else
        (model, Effects.none)


initialModel =
    { username = "", password = "", errors = initialErrors }


app =
    StartApp.start
        { init = (initialModel, Effects.none)
        , update = update
        , view = view
        , inputs = []
        }

main =
    app.html
