require 'sinatra'

PLAYERS = [
  'Bobby Wilson',
  'Cameron Jenness',
  'Chris DeGaetano',
  'Daniel Bennett',
  'Heath Schneider',
  'Jeff Saracco',
  'Joe Tano',
  'Josh Reilly',
  'Justin Potvin',
  'Kris DeBonville',
  'Mark Eicher',
  'Michael Plichta',
  'Paul Vorderis',
  'Ryan Thomas',
  'Zachary Goldman'
]

NL_TEAMS = [
  'Atlanta Braves',
  'Miami Marlins',
  'New York Mets',
  'Philadelphia Phillies',
  'Washington Nationals',
  'Chicago Cubs',
  'Cincinnati Reds',
  'Milwaukee Brewers',
  'Pittsburgh Pirates',
  'St. Louis Cardinals',
  'Arizona Diamondbacks',
  'Colorado Rockies',
  'Los Angeles Dodgers',
  'San Diego Padres',
  'San Francisco Giants'
]

AL_TEAMS = [
  'Baltimore Orioles',
  'Boston Red Sox',
  'New York Yankees',
  'Tampa Bay Rays',
  'Toronto Blue Jays',
  'Chicago White Sox',
  'Cleveland Indians',
  'Detroit Tigers',
  'Kansas City Royals',
  'Minnesota Twins',
  'Houston Astros',
  'Los Angeles Angels of Anaheim',
  'Oakland Athletics',
  'Seattle Mariners',
  'Texas Rangers'
]

get '/' do
  @players = PLAYERS
  @teams = AL_TEAMS + NL_TEAMS
  haml :index
end

get '/randomize' do
  @player_teams = []

  d = Date.today + 1

  seed = Time.new(d.year, d.month, d.day, 0, 0, 0, "-04:00").to_i

  al_teams = AL_TEAMS.shuffle(random: Random.new(seed))
  nl_teams = NL_TEAMS.shuffle(random: Random.new(seed + 1))
  players = PLAYERS.shuffle(random: Random.new(seed + 2))

  players.each_with_index do |player, index|
    @player_teams.push( {
      player: player,
      nl_team: nl_teams[index],
      al_team: al_teams[index]
    })
  end

  haml :drawing
end
