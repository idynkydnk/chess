<h2>Chess</h2>
<p>This is a chess program that is played on the command line. To start the program execute the game.rb file from the lib directory.</p>
<p><a href="/SamuelLangenfeld/Chess/blob/master/screenshots/Menu_screenshot.png" target="_blank"><img src="/SamuelLangenfeld/Chess/raw/master/screenshots/Menu_screenshot.png" alt="" style="max-width:100%;"></a></p>
<p>The game can be played by two players or you can play against a simple AI who makes a random legal move.</p>
<p>Saved games can be loaded from the starting menu.</p>
<p><a href="/SamuelLangenfeld/Chess/blob/master/screenshots/start_screenshot.png" target="_blank"><img src="/SamuelLangenfeld/Chess/raw/master/screenshots/start_screenshot.png" alt="" style="max-width:100%;"></a></p>
<h2><a id="user-content-gameplay" class="anchor" href="#gameplay" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Gameplay</h2>
<p>To make a move enter the chess notation of the starting square and the end square. For example, 'g1 f3' or 'G1 F3'. You can also enter 'save' to save your current game.</p>
<p><a href="/screenshots/screen1.png" target="_blank"><img src="/screenshots/screen1.png" alt="" style="max-width:100%;"></a></p>
<p>Only legal chess moves are allowed. If a player is in check, they must make a move that will not leave them in check. The game ends when a player is in checkmate or when a stalemate occurs. A stalemate happens when a player is not in check but has no legal moves.</p>
<p>Chess special moves are allowed, such as castling, pawn double moves, pawn promotion, and en passant.</p>
<h2><a id="user-content-draw" class="anchor" href="#draw" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Draw</h2>
<p>Draws other than stalemate have not been implemented. These include:</p>
<p>Draw by agreement</p>
<p>Threefold repetition</p>
<p>Fifty move rule</p>
<p>Insufficient material</p>