require 'sinatra'

PLAYERS = [
  'Michael Plichta',
  'Paul Vorderis',
  'Mark Eicher',
  'Cameron Jenness',
  'Bobby Wilson',
  'Daniel Bennett',
  'Josh Reilly',
  'Zachary Goldman',
  'Nicolas de Elia',
  'John Storck III',
  'Erik Storck',
  'Christopher DeGaetano',
  'Justin Potvin',
  'Jeff Saracco'
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

  al_teams = AL_TEAMS.dup
  nl_teams = NL_TEAMS.dup

  @player_teams = PLAYERS.map do |player|
    nl_team = nl_teams.sample
    nl_teams = nl_teams - [nl_team]
    al_team = al_teams.sample
    al_teams = al_teams - [al_team]
    {
      player: player,
      nl_team: nl_team,
      al_team: al_team
    }
  end

  haml :drawing
end
