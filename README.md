Test app displays list of 10 musical instruments.

## Task #1

>Написать приложение, в котором будет один экран с таблицей (UITableViewController). В таблице каждая ячейка (UITableViewCell) должна содержать следующую информацию:  картинка (UIImageView) и справа от нее текст (UILabel). В таблице должно быть 10 ячеек высотой 80 пикселей.  В качестве картинки показать любую картинку добавленную в проект и в качестве текста показать любой текст, но они должны быть разными для каждой ячейки.  Экран должен быть создан в Storyboard с использованием Autolayout.



###Model


*APInstrument* object represents musical instrument

*APInstrumentsManager* plays role of some data provider it allows to generate list of instruments

###UI
*APTableViewCell* present musical instrument (APInstrument) in table
