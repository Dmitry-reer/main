CC=gcc
SRC_DIR := src
OBJ_DIR := obj
# Находим все .c файлы
SRCS := $(shell find $(SRC_DIR) -name "*.c")
# Создаем список .o файлов в папке obj
OBJS := $(SRCS:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)
TARGET := app
$(TARGET): $(OBJS)
	@echo -=- Compiler: $(CC)
	@echo -=- Objects: $(OBJS)
	$(CC) $(OBJS) -o $@
# Правило для создания объектных файлов
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@echo -=- *.c:  $(SRC_DIR)/%.c
	@echo -=- *.o:  $(OBJ_DIR)/%.o
	
# Автоматическая переменная $(@D) (директория цели)
	@echo -=- @D  $(@D)
# Проверяет, существует ли папка, и создает её	
	@mkdir -p $(@D)		

# $< — имя только первой зависимости.	
# $@ — имя целевого файла (то, что слева от двоеточия).
	$(CC) $(CFLAGS) -c $< -o $@
clean:
	rm -rf $(OBJ_DIR) $(TARGET)
