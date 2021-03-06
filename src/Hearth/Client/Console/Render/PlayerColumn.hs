{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}


module Hearth.Client.Console.Render.PlayerColumn (
    playerColumn
) where


--------------------------------------------------------------------------------


import Hearth.Engine
import Hearth.Model
import Hearth.Client.Console.Render.BoardHeroColumn
import Hearth.Client.Console.Render.DeckColumn
import Hearth.Client.Console.Render.HeroPowerColumn
import Hearth.Client.Console.Render.ManaColumn
import Hearth.Client.Console.Render.WeaponColumn
import Hearth.Client.Console.SGRString


--------------------------------------------------------------------------------


playerColumn :: (HearthMonad k m) => Handle Player -> Hearth k m [SGRString]
playerColumn player = do
    deckCol <- deckColumn player
    manaCol <- manaColumn player
    heroCol <- boardHeroColumn player
    heroPowerCol <- heroPowerColumn player
    weaponCol <- weaponColumn player
    return $ concat [
        deckCol,
        txt "",
        manaCol,
        txt "",
        heroPowerCol,
        txt "",
        heroCol,
        txt "",
        weaponCol ]
    where
        txt str = [str]






