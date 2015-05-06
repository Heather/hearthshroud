{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE LambdaCase #-}


module Hearth.DeckToHand where


--------------------------------------------------------------------------------


import Hearth.Model


--------------------------------------------------------------------------------


class DeckToHand d h | d -> h where
    deckToHand :: d -> h


instance DeckToHand DeckCard HandCard where
    deckToHand = \case
        DeckCardMinion minion -> HandCardMinion minion
        DeckCardSpell spell -> HandCardSpell spell





