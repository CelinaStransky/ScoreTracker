List appBarTitle = ['Score Tracker', 'Spielstandszähler'];
List reset = ['reset', 'zurücksetzen'];
List home = ['Home', 'Heimat'];
List settings = ['Settings', 'Einstellungen'];
List teamNames = ['Team Names', 'Team Namen'];
List colorScheme = ['Color Scheme', 'Farbschema'];
List select = ['Select', 'Fertig'];
List languageList = ['Language', 'Sprache'];
List switchTeams = ['Switch Teams', 'Teamtausch'];
List switchTeamsAlert = ['Switch Team Hint', 'Teamtausch Hinweis'];
List switchTeamAfter = ['Switch Teams after ...', 'Teams tauschen nach ...'];
List switchCompleted = ['Players Switched', 'Spieler getauscht'];
List explanationTeamSwitch = [
  'This app was originally designed for playing Ping-Pong. If the Team Switch Hint is enabled, you will get a colorful remider, to Switch positions/Teams after the specified amount of points',
  'Diese App wurde urprünglich für Tischtennis entwickelt. Wenn der Teamtausch Hinweis aktiviert wurde, bekommst du einen farbigen Hinweis, nach der vorher festgelegten Anzahl an Punkten Teams/Positionen zu wechseln.'
];
List hint = ['Hint', 'Hinweis'];

int currLang = 0;

Map<String, List> languageMap = {
  'appBarTitle': appBarTitle,
  'reset': reset,
  'home': home,
  'settings': settings,
  'teamNames': teamNames,
  'colorScheme': colorScheme,
  'select': select,
  'language': languageList,
  'switchTeams': switchTeams,
  'switchTeamsAlert': switchTeamsAlert,
  'switchTeamAfter': switchTeamAfter,
  'switchCompleted': switchCompleted,
  'explanationTeamSwitch': explanationTeamSwitch,
  'hint': hint,
};
