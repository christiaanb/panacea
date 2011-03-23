%include panacea.fmt
\section{Introduction}
C$\lambda$aSH~\cite{eemcs18376}. See the arrows code (Listing~\ref{code:arrow_class}). Inline code: \hs{(first f) >>> (second g)}

\begin{listing}{The arrow type class}{code:arrow_class}
\begin{code}
class Arrow α where
  pure   :: (β -> γ) -> α β γ
  (>>>)  :: α β γ -> α γ δ -> α β δ
  first  :: α β γ -> α (β,δ) (γ,δ)
\end{code}
\end{listing}

\noindent Listing (\ref{code:redcircuit_arrows}) with Arrows syntax, line-numbers turned off:

\begin{listing}{Reduction circuit with arrows}{code:redcircuit_arrows}
%format mC    = "\mathcal{C}"
%format mD    = "\mathcal{D}"
%format mP    = "\mathcal{P}"
%format mR    = "\mathcal{R}"
%format mI    = "\mathcal{I}"
\numbersoff
\begin{code}
rc mP = proc (x,i) do -> y
  rec
    (new,d)                     <- mD  ^^^   _(mD)(0)  -< i
    (_(i)(1), _(i)(2))          <- mI  ^^^   _(mI)(0)  -< (x, d, δ)
    ρ                           <- mP  ^^^   _(mP)(0)  -< (_(a)(1),_(a)(2))
    (r,y)                       <- mR  ^^^   _(mR)(0)  -< (new, d, ρ, r')
    (_(a)(1), _(a)(2), δ, r')   <- mC  ^^^   _(mC)(0)  -< (_(i)(1), _(i)(2), ρ, r)
  returnA -< y
\end{code}
\end{listing}

\noindent Listing (\ref{code:mac}) with Arrows syntax, line-numbers turned on again:

\begin{listing}{Composing MAC components}{code:mac}
\begin{code}
macsum = γ (a,b,c,d) => (_(r)(1) + _(r)(2))
  where
    _(r)(1) <- mac ^^^ 0 -< (a,b)
    _(r)(2) <- mac ^^^ 0 -< (c,d)
\end{code}
\end{listing}