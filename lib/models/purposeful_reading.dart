class PurposefulReadingModel {
  final String name;
  final List<PurposefulReadingBodyModel> models;

  PurposefulReadingModel({required this.name, required this.models});
}

abstract class PurposefulReadingBodyModel {}

class PRText extends PurposefulReadingBodyModel {
  final String text;

  PRText(this.text);
}

class PRMarkerText extends PurposefulReadingBodyModel {
  final String text;

  PRMarkerText(this.text);
}

class PRTitle extends PurposefulReadingBodyModel {
  final String text;

  PRTitle(this.text);
}

class PRImage extends PurposefulReadingBodyModel {
  final String src;

  String get imageSrc => 'assets/images/reading/$src.png';


  PRImage(this.src);
}

class PRTable extends PurposefulReadingBodyModel {
  final String name;
  final String value;

  PRTable(this.name, this.value);
}

List<PurposefulReadingModel> purposefulReadingModels = [
  PurposefulReadingModel(name: 'Betting markets explained', models: [
    PRText(
        'Betting Markets are the specific sports events that differ from one sport to another usually posted by sportsbooks to help you make decisions when you wish to wager the desired event in a certain game.'),
    PRText(
        'All the betting markets are valued using odds. Presented as the decimals or fractions, odds are a current value offered by a single market for you to wager. The higher the odds the higher the payout and vice versa. Odds usually vary from one another as a result of the strength and weakness of either team/side during the match day. The smaller the odds the stronger the opponents and vice versa.'),
    PRText(
        'This means, If team X has a higher rank compared to team Y then, the odds for team X are much expected to be low and eventually keep dropping as matchday approaches compare to the odds for team Y. This brings you to an understanding of the probability or likelihood for specific events to occur that is, the lower the odds the higher the probability of an event to be able to occur.'),
    PRTitle('1×2'),
    PRText(
        'The 1×2 market refers to wagers on one of three probable match final results that is home win (1), a draw(x), or away win(2). This is the most popular market compared to other markets.'),
    PRTitle('BTTS'),
    PRText(
        'This stands for Both Teams to Score or Goal-Goal (GG) markets which require both teams to score at least a goal in case the punter opted YES and vice versa if selected NO. The selection of NO has two implications, first one team to score a goal or no goal at all.'),
    PRTitle('Over/Under 2.5 Goals'),
    PRText(
        'The Over/Under 2.5 Goals market stands for the total number of goals scored in a whole match whereby the punter can predict 3 goals or more if he/she is betting on Over 2.5 Goals and less than 3 match goals if opted for Under 2.5 Goals'),
    PRTitle('Correct Score'),
    PRText(
        'This is an exact final goal scored by both teams at full time or halftime. It depicts a win or a loss or a draw of teams using the accurate number of goals expected to be scored.'),
    PRTitle('Double Chance'),
    PRText(
        'Double chance combines two of the three potential (1X2) outcomes into a single market that is a Home win or Draw (1X), Away win or Draw (X2), and Home or Away (12) as the probable final results.\n'
        'The possibility to win a bet is high with a double chance market since the risk has been reduced.'),
    PRTitle('Corners'),
    PRText(
        'This involves betting on which side will kick more corners than the other or match to end with equal corners presented as 1 for the home team, X for a draw, and 2 for the away team to score more corners. Yet this market offers you to also bet on Over and Under a certain number of corners.'),
    PRTitle('Handicap'),
    PRText(
        'A handicap adds negative goals/points to the stronger team and positive goals/points to the weaker team before the game starts. To decide if the pick has won, the handicap is added to the final score of the game.'),
    PRTitle('Halftime/Fulltime'),
    PRText(
        'This Market is offer you the chance to bet on a normal home win, draw, or away win (1×2) by first halftime and fulltime'),
    PRTitle('Bookmaker betting markets comparison'),
    PRText(
        'The best way to compare the betting markets from different bookmakers is by reviewing the odds payout percentage and checking how many markets are available in a specific sportsbook.'),
    PRText(
        'Our recommended bookmakers have been well-reviewed with a balanced scorecard on each of their review pages, while the betting site Betway leads the score with a 98/100 betting offer with an overall score of 96/100. With just little inadequacy in markets and other features, the rest of the bookmakers comes below the Betway in providing the best-betting markets to clients.'),
    PRText(
        'Betting market filter is also among the key unique feature that distinguishes bookmakers because going through checking market availability can be very tricky if the bookmaker has poor tools for filtering their markets.'),
    PRTitle('How to use betting markets?'),
    PRText(
        'There are various ways you can use the betting markets but the best strategies come with minimum loss while you get the most out of bookies. If you think of maximizing profit out of your stake then think of how the odds can be boosted by your selection. When you add more selection into a single betting slip the cumulative odds for all selection also becomes huge and this means the stake returns get bigger too.'),
    PRText(
        'You can start by checking out if a certain bookmaker allows you to bet thru single bet, multi bet, banker bet, or system bet. Then, go further into getting an insight on how to use each of these strategies to your advantage. We have shared some light about these techniques as follows:'),
    PRMarkerText(
        'Single bet: This involves betting on a single outcome of an event, For Example, you want to bet on team x win only. This strategy is very good if you have the finest single selection and you want to invest a huge stake. It also has little returns if the stake is very low hence is not good for punters with low capital.'),
    PRMarkerText(
        'Multi-bet: This is a combination of several single bets to form a long list of events in a single betting slip. It is very useful when punters have a low stake and wants to win a huge amount. This kind of strategy is very tricky as when you lose one selection the whole ticket is lost too.'),
    PRMarkerText(
        'Banker bet: This is a multi-bet with events ranging from 3 to 8 while one event is chosen to be marked as banker selection. This strategy is the resolution of lost tickets in multi-bet. Your ticket can never be lost as long as banker selection was successful.'),
    PRMarkerText(
        'System bet: This is a combination of several Banker bets to form different arrangements of betting slips. It is very useful for punters as it gives assurance of relying on other arrangements of events when others have lost. This is an upgrade of the accumulator bet.'),
  ]),
  PurposefulReadingModel(name: 'What Type of Bet is Most Profitable?', models: [
    PRText(
        'Finding the most profitable bet is no easy task. College football is considered the most profitable sport to bet on, but that doesn’t mean that you should only place moneyline bets on college football.'),
    PRText(
        'Instead, we suggest focusing on a sport that you know and follow closely. For example, if you’re an NBA fan, you’ll likely know what to expect from a matchup.      If the Celtics are playing against the 76ers, you should consider the strengths and weaknesses of each team and place your bet accordingly. Or, you can bet on over/under if you think that it will be a high or low scoring game.'),
    PRText(
        'Moreover, parlay bets can bring the highest profit, but they’re hard to win – and they become increasingly harder with every new leg that you add to the betting slip. For example, if you place a parlay with 10 legs, you might get odds that count in the thousands, but you’ll have to win every leg in the parlay for the bet to win.'),
    PRTitle('Best Bet Types for Beginner Bettors'),
    PRText(
        'If you’re at the beginning of your sports betting journey, we suggest starting with simple bets that are easy to understand and won’t break the bank. If you received insurance bet stakes or bet credits from the sportsbook you registered on, they usually come with specific terms and requirements and are often only eligible for specific betting types.'),
    PRText('The best place to start is with the standard three bets:\n'
        '   • moneyline\n'
        '   • point spreads\n'
        '   • totals bets'),
    PRText(
        'Don’t overcomplicate your wagers and only bet on teams that you know or have done your research on. You can also experiment with parlay bets, combining two or three selections.'),
    PRImage('1'),
    PRText(
        'When you feel comfortable enough, you can move onto some more advanced betting strategies.'),
    PRTitle('Best Bet Types for Seasoned Bettors'),
    PRText(
        'The best legal US sportsbooks are always looking for attractive propositions to offer their customers. If you are already familiar with the standard markets, player props, game props and futures and want to up your game a bit, then you should try some of the following bets:\n'
        '   • Round Robin Bets\n'
        '   • Quarters/Halves/Periods\n'
        '   • Teasers/Pleasers\n'
        '   • Quick Live Bets (flash bets)\n'
        '   • Alternate spreads/totals\n'
        '   • Same Game Parlays'),
    PRText(
        'Flash bets are basically live betting markets that relate to the next few minutes of action, or what will happen next in a game. Same game parlays are combination bets that can be placed on the same game. You need to be wary of the latter, as not all types of same game bets can be combined into an SGP.'),
    PRText(
        'Round robins are really advanced system  bets, and they can be extremely useful. You will need a slightly larger budget to place those system bets, and the cover they provide tends to be much better when you pick selections with odds of +200 or more.'),
    PRText(
        'A lot of bettors will opt for bets on halves or quarters. There is a lot of statistical information that you can check out which helps with these kinds of bets, and if you also factor in the option to make live bets on the current period or the next, then you can really take advantage of the bets.'),
  ]),
  PurposefulReadingModel(
    name: 'What Are the Different Types of Bets?',
    models: [
      PRText(
          'There are dozens of different types of sports bets, with some of them being much more complex than others. We’ll start with the most common and the simplest bets that you can place at US sportsbooks and still come out in profit.'),
      PRTable('Bet type:', 'Meaning:'),
      PRTable('Moneyline/ Win bets',
          'A bet in which you bet on which team will win the sporting event.'),
      PRTable('Point spread / Handicap bets',
          'A type of bet where you’re betting on the margin of victory or a loss in a sporting event.'),
      PRTable('Over/Under bets / Totals',
          'You’re betting whether the combined score of both participants in a sporting event will be over or under the projected number.'),
      PRTable('Alternate Point spread / Handicap bets',
          'The betting line with the simple point spread levels the playing field between two teams. With alternate point spreads, you can pick the handicap or points boost you want to assign a team, and each line comes with different odds.'),
      PRTable('Alternate Totals/ Over/Under bets',
          'You can bet over or under a line that is not the official one. Like alternate point spreads, each betting line has different odds for the over and under bets.'),
      PRTable('Parlays / Accumulators',
          'A bet that includes multiple legs of bets. The odds of each leg are multiplied, and they all need to win for you to win the bet.'),
      PRTable('Futures / Outright win bets',
          'A bet in which the bettor selects the outright winners of a competition well in advance of the event happening.'),
      PRTable('Proposition bets',
          'A bet that’s not tied to the result of the game, but other events that are happening'),
      PRTable('Teaser bets',
          'A type of parlay bet in which you can move the point spreads of the legs to your advantage - which comes with the cost of lower odds'),
      PRTable('Pleaser bets',
          'Just like teasers, pleasers are similar to parlay bets, but you can move the point spreads to make it harder for you to win, but get better odds.'),
      PRTable('Round Robins / If bets / Reverse bets',
          'These are complex bets with multiple wagers and selections. They’re parlays in which different bets are tied conditionally to one another, and the next bet is directly connected to the previous one.'),
      PRTable('Permutation betting / Combined betting',
          'It’s another type of a parlay bet, but it includes multiple parlay bets combined into one. The wagers can be placed on different selections, and, in comparison to standard parlays, not all legs have to win for the bet to be a winning one.'),
      PRText(
          'In the above table, you can see all the standard and some advanced bet types. Now, let’s look at each bet in detail, and see how they can be applied into your betting strategy.'),
      PRTitle('Moneyline Bets'),
      PRText(
          'Moneyline bets are bets on which player or team will win a single game. There are no conditions apart from picking the winner, so just how they win or by what margin is irrelevant.'),
      PRText(
          'In a moneyline bet, each team or athlete (in individual sports such as tennis) is assigned betting odds that indicate the potential payout for a correct wager. There are two-way or three-way moneyline bets, depending if there’s a draw in the given sport.'),
      PRImage('2'),
      PRText(
          'When it comes to the odds, each American odds moneyline bet has a favorite and an underdog. Oddsmakers choose which team will be the favorite, and which team will be the underdog based on their recent performances, form, starting lineup list, injury list, home team advantage,etc.'),
      PRText(
          'The odds for the favorite are lower when compared to the underdog odds, and are usually displayed as a negative moneyline. For example, if the Los Angeles Lakers are playing the Golden State Warriors and the Warriors are the favorites, they might receive odds of -305. What this means is that you need to wager \$305 to win \$405, or be \$100 in profit.'),
      PRText(
          'If the odds for the Lakers are +240, for example, it means that if you wager \$100 on the Warriors, you’ll receive a payout of \$340 if your bet wins – with \$240 in profit.'),
      PRText(
          'Other forms of moneyline exist too, such as 1st quarter 3 way moneyline, which is only applicable in sports that are a) split into quarters b) can end in a draw.'),
      PRTitle('Point Spread Bets'),
      PRText(
          'Point spreads, popularly known as spread betting or handicap betting, is a form of sports betting in which the bettor wagers on the margin of victory in a sporting contest. This type of betting aims to eliminate the favorite and underdog and create an even playing field for both participants in the event.'),
      PRText(
          'For example, if the NY Mets are playing against CIN Reds, and the Mets are the favorites in the matchup, the point spread, called a runline in baseball, may be -1.5 for the Mets. This means that the Mets must win the game by two or more runs for you to win the bet.'),
      PRImage('3'),
      PRText(
          'The point spread odds are usually placed right next to the moneyline odds, and the favorite is indicated with a negative number, while the underdog is represented with a positive number. Since the handicap makes the playing field more even with point spread betting, the odds are usually lower for the underdog, and higher for the favorite.'),
      PRText(
          'Essentially, with handicap bets, you should consider the margin of victory instead of picking who will win the contest. Point spread bets add a level of excitement and keep bettors on the edge of their seats until the final whistle. A sub-variant of point spreads are so-called PK or Pick’Em bets, which basically represents a zero point spread, with no apparent favorites in the matchup.'),
      PRTitle('Alternate Point Spreads'),
      PRText(
          'The standard point spread gives the underdogs a boost and the favorites a point reduction, to essentially bring a balance to the two teams. The odds are usually -110 or thereabouts, which means that there is a 50-50 chance of either team winning.       With alternate spreads, you can shift the betting line, to increase the odds and risk, or shorten the odds and decrease the risk. Predicting betting lines is hugely popular in the states, and successful alternate point spread bettors can make buckets of money with winning lines.'),
      PRTitle('Over/Under (Totals bet)'),
      PRText(
          'Over/under is a popular type of bet that focuses on the combined score of both teams rather than the winner. With this type of bet, you don’t have to predict which team will win the contest, nor care about the margin of victory. Instead, you’re wagering on whether the final score will be over or under the number set by the sportsbook.'),
      PRText(
          'Let’s take NBA wagers for example. The Denver Nuggets are playing at Phoenix Suns, and the sportsbook sets the over/under at 226 points. This means that if you bet on over, both teams should score a combined of 227 points or more for you to win the bet. If you bet on under, the final combined score should be below 226 points for you to win the bet.'),
      PRImage('4'),
      PRText(
          'In over/under bets, the sportsbook sets a number that’s usually a half-point to avoid a push, and the bettor should predict if the final score will be over or under that. If the final score is the exact number that was set by the sportsbook, 226 in our case, the bet is considered a push and the bettor will get a full refund of their wager.'),
      PRTitle('Alternate Total Points'),
      PRText(
          'Alternate totals offer even more betting lines, so you do not need to stick with the official total points line. This way, you can shoot for longer odds, by betting over a higher line or betting under a lower line. Of course, you can always go for the less risky approach, namely by picking a higher line and betting under, or picking a lower line and betting over.'),
      PRTitle('Prop Bets'),
      PRText(
          'Prop bets or proposition bets are special bets that don’t focus on the result of the game, but on all the other things that are happening during a match. For example, you can place a prop bet on how many points Nikola Jokic will score in game 6. The sportsbook might provide an over/under prop bet, and you can choose whether the player will score over or under that number. These bets are called player props.'),
      PRImage('5'),
      PRText(
          'There are also team props, in which you can bet on something that the team might do. For example, in a soccer match between Manchester United and Liverpool, you can bet which team will receive more corners or yellow cards.'),
      PRText(
          'Due to the nature of prop betting, sportsbooks often offer dozens of prop bets for a single matchup. However, some states prohibit placing prop bets on college sports.'),
      PRTitle('Futures Bets'),
      PRText(
          'As the name suggests, futures bets focus on events that will take place in the distant future. That’s relatively speaking, of course, but with these bets, you can bet on which team will win the league for example, or which team will make the playoffs.'),
      PRText(
          'When it comes to NFL wagers, you can place a futures bet on which team will win the next Super Bowl. The odds for futures bets depend on the team’s form, roster, schedule, injury list, etc. At the moment, Kansas City Chiefs are the favorites to win the Super Bowl with odds of +600, followed by the Philadelphia Eagles with odds of +800, and the San Francisco 49ers with odds of +800.'),
      PRImage('6'),
      PRText(
          'As you can see, the odds for futures bets are usually high because it’s hard to predict which team will win before the season starts. However, the odds are not fixed, and they’ll change when the season starts.'),
      PRTitle('Parlay Bets'),
      PRText(
          'A parlay bet, or an accumulator bet, is a type of bet in which sports bettors combine multiple betting lines into a single betting slip. For example, you can place a moneyline bet that the Nuggets will win against the Suns, and bet on the Knicks vs Heat game to go over.'),
      PRText(
          'Parlay bets usually have much higher potential payouts, but you must win all the bets in the betting slip for you to win the parlay. With these bets, you’re not limited to only one betting type, league, or a sport. For example, you can combine moneyline boxing wagers with MLB wagers, NHL wagers, and tennis wagers in the same parlay.'),
      PRImage('7'),
      PRText(
          'The odds of each leg are multiplied, so the potential payout is massive. Although most online sportsbooks will calculate the potential payout of a parlay automatically, you can calculate them manually by converting American odds to decimal odds. Then, multiply all the bets in the parlay together, and then multiply that number by the bet amount.'),
      PRText(
          'Same-game parlays have become a popular betting type in the US as well, and it’s offered by many sportsbooks. As the name suggests, you can place different bets for the same event and combine them in a parlay. For example, you can place a moneyline bet that Inter will win against Milan in the Champions League, and place an over 2.5 goals bet for the same match. Round-robins are another variation of parlay betting adding some safety to this wager.'),
      PRTitle('Live Betting'),
      PRText(
          'As the name suggests, live betting means that you can bet on an event after it has started. This is not a separate type of bet, and you can usually place the same bets that you can with standard betting, such as moneylines, point spreads, and over/unders, but there are some interesting betting types that apply to live betting only.'),
      PRText(
          'For example, you can bet on which team will have the next possession, or which player will win the next point in tennis wagers. Live betting can also be a useful betting strategy tool when practicing hedge betting or cover bets, as the odds are changing in real-time.'),
      PRTitle('Teaser and Pleaser Bets'),
      PRText(
          'These bets are similar to parlays in many ways, with some key differences. With teaser and pleaser bets, you can place a parlay at reduced or increased odds by manipulating the spread. Commonly, you can find teasers of +6, +6.5 and +7 at sportsbooks that offer this type of bet. Of course, there are some betting sites that have even more options for teaser bettors.'),
      PRText(
          'With teaser bets, you must pick at least two teams to wager on. This means that, just like with parlays, if one leg of the teaser bet loses, the whole bet is lost.'),
    ],
  ),
  PurposefulReadingModel(
    name: 'Betting staking methods',
    models: [
      PRText(
          'We present you the 5 five betting staking methods and you can choose which is the most suitable for your betting plan.'),
      PRTitle('Strategy 1: Bet everything, every time'),
      PRText(
          'Bet your entire bankroll on each bet. The advantage is that you get big returns, fast. The downside? As soon as you lose, you’re out of money and out of the game.'),
      PRTitle('Strategy 2: Fixed wager'),
      PRText(
          'Bet a fixed amount for each bet, and don’t vary no matter how much you win. In this example, it was \$100. If your chance of winning 55% on a 2.000 bet, this method means you’ve dramatically reduced your chance of losing your entire stake. Unfortunately, it means your winnings are limited to increase in a “slow and steady” fashion.'),
      PRTitle('Strategy 3: Martingale'),
      PRText(
          'Bet double your stake after any failed bet, to cover your losses with the next bet’s winnings. This gives a quicker increase than fixed wagers (as you’re doubling up to cover any losses). If you experience sequential losses, however, the required stakes continue to double, and you’ll very soon be betting large amounts to cover your losses.'),
      PRTitle('Strategy 4: Fibonacci'),
      PRText(
          'Increase your stake in a Fibonacci sequence, to your losses with the next bet’s winnings – learn more about the Fibonacci sequence here. This method has similar drawbacks to Martingale, but it reduces how quickly the stake increases if you’re on a losing streak (and therefore also reduces the rate at which you win).'),
      PRTitle('Strategy 5: Proportional betting'),
      PRText(
          'Bet a fraction of your bankroll in proportion to your edge. In this simulation, we used the Kelly equation for proportional betting. In Kelly, your bet should be your edge divided by the odds. In this example, as the edge is 10% and the odds are evens, 10 / 1 is 10.'),
      PRText(
          'Therefore 10% of the \$1000 wallet should be bet: \$100. Should that bet be successful, the next bet would increase to \$110, 10% of the new \$1100 wallet. This means winnings increase quicker than in the fixed-wager system, and losses slow down.'),
      PRText('The correct answer is:\n'
          '   • Bet everything\n'
          '   • Martingale\n'
          '   • Fixed wager\n'
          '   • Proportional Betting\n'
          '   • Fibonacci'),
      PRText(
          'As you can tell from the descriptions above, proportional betting appears to have a natural advantage over the others systems. Imagine you’re down to your last \$100 – you’d be betting \$10, (and decreasing), keeping you in the game for much longer than a fixed-bet system, where your last \$100 would be your last bet.'),
      PRTitle('Which strategy is which?'),
      PRText(
          'Bet everything brings in big gains after the first bet, earning as much in one risk than the others do in the first seven. The light that burns seven-times as bright burns a thousandth as long, however, the “bet everything” strategy is eliminated on just the second round.'),
      PRText(
          'The chance of making it through 1,000 rounds at 55% is infinitesimally small as to be practically impossible (although you would have earned \$67 billion by round 27).'),
      PRText(
          'Fibonacci and Martingale – progressive betting systems – also start strongly, but any big sequence of losses ramp up the required stake.'),
      PRText(
          'In our simulation, at round 83 (R83), we lost 11 times in a row. These defeats totally wiped out both Fibonacci and Martingale’s stakes, and at the end 11-in-a-row streak the hypothetical Martingale bettor had to bet \$403,000 dollars to recuperate his losses. That’s a huge amount, considering his maximum purse was just \$6,300. For Fibonacci, the maximum bet was \$33,500, with his purse reaching its zenith at \$4,100 before the wipeout.'),
      PRText(
          'The only system other than proportional betting to avoid losses was fixed betting, which accrued slow but steady increments. By R83, fixed betting had increased its purse to \$3,400, and afterwards it had only dropped to \$2,300. It wasn’t out, but there was not a lot to show for 95 bets.'),
      PRText(
          'The 11-bet losing streak also hit proportional betting pretty hard, reducing its winnings from \$7,359 to \$2,286 – lower than that of fixed betting. This shows how well fixed betting protects your winnings. However, by bet 500, fixed betting had only brought in \$6,400, while proportional betting had earned \$18,275.'),
      PRText(
          'Bettors should note that this is based on a huge assumption that the edge is in your favour, without it the results for all staking strategies would change dramatically.'),
      PRTitle('Backing your staking technique'),
      PRText(
          'The above simulation shows that different staking techniques have vastly different outcomes, even if the other variables stay the same. The difference between being wiped out and finishing with \$18,275 after 500 bets was simply choosing a suitable staking system.'),
      PRText(
          'It’s important however, to remember that there is no “ideal” system. Although the Kelly system worked in the example above, there may be more developed systems for different types of bets. It’s important to discover which staking style is suitable to your betting, typically through research and simulation.'),
      PRText(
          'It’s also important to remember that the Kelly system only works if you know your edge, which you use to calculate your stake. If your calculation of your edge is incorrect, you’re still going to have difficulties whatever you do. Read through the rest of our archive to help sharpen yours.')
    ],
  ),
  PurposefulReadingModel(
      name: 'Latest Secret of Winning Bets Revealed',
      models: [
        PRText(
            'Prediction of games can be a very tough process for even experienced and regular bet players. Statistics obtained from a top betting site like 10Bet has shown a sharp decline in bet wins in recent times.'),
        PRTitle('Bet Everything'),
        PRText(
            "Every time you make a bet, you can adopt the strategy of betting everything. The advantage to this method is that you may get large returns quickly. The downside of this is that if you lose the bet, you lose all of the money, and you are put out of the game."),
        PRText(
            "This is so true especially in football where nowadays, anyone can beat anyone. The days when one can comfortably sit at home and predict results of games seem to be long gone as today it is not unthinkable for Manchester United to be beaten by a team as little as Huddersfield. The so called little teams,having huge odds stacked against them, now humiliate their bigger opponents who have being predicted to win them mercilessly making it hard for people to predict games and win. To better appreciate the dilemma faced by people when trying to predict football games, one has to look at the just concluded round of Champions League games where teams which should have won were beaten by less fancied sides leading to loss of millions of dollars by so many bettors."),
        PRText(
            "The night's disappointment had begun with Maribor vs Sevilla. Sevilla was an outright favourite to overcome Maribor--a side that was ripped apart by Liverpool. The Spanish giants failed woefully on the night, only managing a draw. Next up was in form Napoli who were facing an unfancied Feyenoord side, the Italians had gone on to lose 2:1--result which has consigned them to Europa league football and had made so many people to lose huge sums of money. Manchester City's shock 2:1 loss to Ukrainian outfit Shaktar Donetsk and RB Leipzig capitulation at home to Turkish side Besiktas were further games which illustrate how difficult game prediction can be."),
        PRText(
            "However a new secret has been discovered that is helping so many people make better prediction with less stress and faster than before. This secret which was shared by people who have become regular winners of football bets is a betting site called betting arena. The site is said to be best and has helped many people win big."),
        PRText(
            "The unique features of the site are discussed here. First,on betting-arena.com, statistics and information about games are placed at one's disposal eliminating the stress of having to search for information before placing bets. Bet Arena also shows one the best pick for a match he or she wants to bet. The profit to be made from a bet on each match is usually available on the sitemaking the person betting take the best possible decision. Through betting arena, one knows when it is very recommended to bet on a match and when it is wise to abstain from staking a bet."),
        PRText(
            "The world of bets is battle field where only the fittest survives, so one has to go on into it armed with information so as to conquer. It is why access to sites such as betting arena is not only necessary but is mandatory if one is to hit the jack pot.")
      ]),
  PurposefulReadingModel(
    name: "Find the best betting strategy",
    models: [
      PRText(
          'With the big increase in popularity of online sports betting came the need of strong betting techniques which can be used to reach a long-term profit, which is the wish of every single betting player. It is now almost impossible to keep track of the latest industry developments by oneself, so online bettors may require an expert advice every once in a while so as to broad their horizons and improve their sports betting behaviours.'),
      PRText(
          'It is for that reason that we have established the soccer betting strategies section in the first place some few years back and are now determined to make it even more helpful and resourceful. The players relatively new to the sports betting world are likely to benefit from the beginners guide to soccer betting money management, soccer bet in play, or asian handicap betting, whereas more experienced punters should find a lot of useful hints and tips how to be successful at spread betting or betting exchanges.'),
      PRText(
          'The football betting strategies articles are designed to not only get you acquainted with the latest betting techniques and popular betting types, but also to point out the special features and things you need to pay attention to when taking up one of the new styles of wagering. You can be sure that our betting experts have meticulously studied every single betting strategy before writing the articles and that they have taken their time to find the best possible strategy that could make a positive effect on your total bankroll.'),
      PRText(
          'Nobody can guarantee long term profits even if you closely follow every piece of advice provided by our betting tip tool, but by doing so you will definitely increase your winning chances, which is the first step towards a successful betting campaign.'),
      PRText(
          'Soccer betting strategies section is meant to provide betting help for both amateur bettors and the more experienced punters, and there are no doubts that both groups of our customers will be able to find something of use on these pages. When you decide you are ready to embark on a serious betting campaign, you can check our wide selection of soccer betting tips, whereas the fans of outright bets can check out latest prices on outright markets from top European competitions, brought to you by the most reputable sports betting operators on the web.')
    ],
  )
];
