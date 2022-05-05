# # Контекст определяет интерфейс, представляющий интерес для клиентов.
# class Context
#     # Контекст хранит ссылку на один из объектов Стратегии. Контекст не знает
#     # конкретного класса стратегии. Он должен работать со всеми стратегиями через
#     # интерфейс Стратегии.
#     # @return [Strategy]
#     attr_writer :strategy
  
#     # Обычно Контекст принимает стратегию через конструктор, а также предоставляет
#     # сеттер для её изменения во время выполнения.
#     #
#     # @param [Strategy] strategy
#     def initialize(strategy)
#       @strategy = strategy
#     end
  
#     # Обычно Контекст позволяет заменить объект Стратегии во время выполнения.
#     #
#     # @param [Strategy] strategy
#     def strategy=(strategy)
#       @strategy = strategy
#     end
  
#     # Вместо того, чтобы самостоятельно реализовывать множественные версии
#     # алгоритма, Контекст делегирует некоторую работу объекту Стратегии.
#     def do_some_business_logic
#       # ...
  
#       puts 'Context: Sorting data using the strategy (not sure how it\'ll do it)'
#       result = @strategy.do_algorithm(%w[a b c d e])
#       print result.join(',')
  
#       # ...
#     end
#   end
  
#   # Интерфейс Стратегии объявляет операции, общие для всех поддерживаемых версий
#   # некоторого алгоритма.
#   #
#   # Контекст использует этот интерфейс для вызова алгоритма, определённого
#   # Конкретными Стратегиями.
#   #
#   # @abstract
#   class Strategy
#     # @abstract
#     #
#     # @param [Array] data
#     def do_algorithm(_data)
#       raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
#     end
#   end
  
#   # Конкретные Стратегии реализуют алгоритм, следуя базовому интерфейсу Стратегии.
#   # Этот интерфейс делает их взаимозаменяемыми в Контексте.
  
#   class ConcreteStrategyA < Strategy
#     # @param [Array] data
#     #
#     # @return [Array]
#     def do_algorithm(data)
#       data.sort
#     end
#   end
  
#   class ConcreteStrategyB < Strategy
#     # @param [Array] data
#     #
#     # @return [Array]
#     def do_algorithm(data)
#       data.sort.reverse
#     end
#   end
  
#   # Клиентский код выбирает конкретную стратегию и передаёт её в контекст. Клиент
#   # должен знать о различиях между стратегиями, чтобы сделать правильный выбор.
  
#   context = Context.new(ConcreteStrategyA.new)
#   puts 'Client: Strategy is set to normal sorting.'
#   context.do_some_business_logic
#   puts "\n\n"
  
#   puts 'Client: Strategy is set to reverse sorting.'
#   context.strategy = ConcreteStrategyB.new
#   context.do_some_business_logic


// Базовый класс-издатель. Содержит код управления подписчиками
// и их оповещения.
class EventManager is
    private field listeners: hash map of event types and listeners

    method subscribe(eventType, listener) is
        listeners.add(eventType, listener)

    method unsubscribe(eventType, listener) is
        listeners.remove(eventType, listener)

    method notify(eventType, data) is
        foreach (listener in listeners.of(eventType)) do
            listener.update(data)

// Конкретный класс-издатель, содержащий интересную для других
// компонентов бизнес-логику. Мы могли бы сделать его прямым
// потомком EventManager, но в реальной жизни это не всегда
// возможно (например, если у класса уже есть родитель). Поэтому
// здесь мы подключаем механизм подписки при помощи композиции.
class Editor is
    public field events: EventManager
    private field file: File

    constructor Editor() is
        events = new EventManager()

    // Методы бизнес-логики, которые оповещают подписчиков об
    // изменениях.
    method openFile(path) is
        this.file = new File(path)
        events.notify("open", file.name)

    method saveFile() is
        file.write()
        events.notify("save", file.name)
    // ...


// Общий интерфейс подписчиков. Во многих языках, поддерживающих
// функциональные типы, можно обойтись без этого интерфейса и
// конкретных классов, заменив объекты подписчиков функциями.
interface EventListener is
    method update(filename)

// Набор конкретных подписчиков. Они реализуют добавочную
// функциональность, реагируя на извещения от издателя.
class LoggingListener implements EventListener is
    private field log: File
    private field message: string

    constructor LoggingListener(log_filename, message) is
        this.log = new File(log_filename)
        this.message = message

    method update(filename) is
        log.write(replace('%s',filename,message))

class EmailAlertsListener implements EventListener is
    private field email: string
    private field message: string

    constructor EmailAlertsListener(email, message) is
        this.email = email
        this.message = message

    method update(filename) is
        system.email(email, replace('%s',filename,message))


// Приложение может сконфигурировать издателей и подписчиков как
// угодно, в зависимости от целей и окружения.
class Application is
    method config() is
        editor = new Editor()

        logger = new LoggingListener(
            "/path/to/log.txt",
            "Someone has opened file: %s");
        editor.events.subscribe("open", logger)

        emailAlerts = new EmailAlertsListener(
            "admin@example.com",
            "Someone has changed the file: %s")
        editor.events.subscribe("save", emailAlerts)