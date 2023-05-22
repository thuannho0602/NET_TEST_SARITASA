using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using NETTEST.DataAccess;
using NETTEST.Entity;
using NETTEST.Services.Implementations;
using NETTEST.Services;
using System.Reflection;
using NET_test_task_camp_V2_Saritasa;
using NETTEST.Repository;
using NETTEST.Repository.Implementations;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();


//Add Database

builder.Services.AddDbContext<ApplicationDbContext>(options =>
             options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection"), b => b.MigrationsAssembly("NET_test_task_camp_V2_Saritasa")));



builder.Services.AddIdentity<User, IdentityRole<Guid>>()
               .AddEntityFrameworkStores<ApplicationDbContext>()
               //.AddUserStore<UserStore>()
               .AddDefaultTokenProviders();

builder.Services.Configure<IdentityOptions>(options =>
{
    options.User.RequireUniqueEmail = true;
});


// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();


// Add Services
builder.Services.AddScoped<IUserServices, UserServices>();
builder.Services.AddTransient<IFileRepository, FileRepository>();
builder.Services.AddScoped<IFileServices, FileServices>();
builder.Services.ConfigureJwt(builder.Configuration);



var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
